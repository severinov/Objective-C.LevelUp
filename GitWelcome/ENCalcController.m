//
//  ENCalcController.m
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import "ENCalcController.h"



@implementation ENCalcController


- (id)init
{
    self = [super init];
    if (self) {
        _calcModel = [[ENCalcModel alloc] init];
        _negate = YES;
    }
    return self;
}



//функция чтения сроки и формирования
//итоговой строки
-(int)readInput:(ENEntities *)entity
{
    unichar character;
    int lengthOfOperations = [[_calcModel stackOfOperations] count];
    int lengthOfResult = [[_calcModel stackOfResult] count];

    ENEntities * lastOperation = [[ENEntities alloc] init];
    ENEntities * lastResult = [[ENEntities alloc] init];
    if (lengthOfOperations != 0) {
        lastOperation = [_calcModel operationAtIndex:(lengthOfOperations-1)];
    }
    if (lengthOfOperations != 0) {
        lastResult = [_calcModel operationAtIndex:(lengthOfOperations-1)];
    }
    
    //определение введенного символа
    character = [[entity entity] characterAtIndex:0];
    switch (character) {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            [_calcModel addInResult:entity];
            break;
        case '(':
            [_calcModel addOperation:entity];
            break;
        case ')':
            //перенести все знаки до "(" в итоговый стек
            //и удалить ")"
            [self braceProcessing];
            break;
        case '+':
            if (lengthOfResult == 0) {return ERR;}
            //переносим все знаки с бОльшим приоритетом и до скобок в результат
            if ([lastOperation priority] > LOW) {
                [self operationProcessingWithEntity:entity];
                break;
            }
            [_calcModel addOperation:entity];
            break;
        case '-':
//            if (lengthOfResult == 0) {return ERR;}
            //переносим все знаки с бОльшим приоритетом и до скобок в результат
            if ([lastOperation priority] > LOW) {
                [self operationProcessingWithEntity:entity];
                break;
            }
            [_calcModel addOperation:entity];
            break;
        case '*':
            if (lengthOfResult == 0) {return ERR;}
            //переносим все знаки с бОльшим приоритетом и до скобок в результат
            if ([lastOperation priority] > NORM) {
                [self operationProcessingWithEntity:entity];
                break;
            }
            [_calcModel addOperation:entity];
            break;
        case '/':
            if (lengthOfResult == 0) {return ERR;}
            //переносим все знаки с бОльшим приоритетом и до скобок в результат
            if ([lastOperation priority] > NORM) {
                [self operationProcessingWithEntity:entity];
                break;
            }
            [_calcModel addOperation:entity];
            break;
        case '^':
            if (lengthOfResult == 0) {return ERR;}
            [_calcModel addOperation:entity];
            break;
        default:
            return ERR;
            break;
    }
    return DON;
}



-(void)operationProcessingWithEntity:(ENEntities*)entity
{
    int lengthOfOperations = [[_calcModel stackOfOperations] count];
    ENEntities * lastOperation = [_calcModel operationAtIndex:(lengthOfOperations-1)];
    
    while ([lastOperation priority] > [entity priority] &&
           [lastOperation priority] != BRO &&
           [lastOperation priority] != BRC)
    {
        [_calcModel addInResult: lastOperation ];
        [_calcModel removeOperationAtIndex:lengthOfOperations-1];
        lengthOfOperations--;
        if (lengthOfOperations > 0) {
            lastOperation = [_calcModel operationAtIndex:(lengthOfOperations - 1)];
        }else{
            break;
        }
    }
    [_calcModel addOperation:entity];
}



-(void)compliteProcessing
{
    int lengthOfOperations = [[_calcModel stackOfOperations] count];
    for (int i = lengthOfOperations - 1; i >= 0; i--)
    {
        [_calcModel addInResult:[_calcModel operationAtIndex:i]];
        [_calcModel removeOperationAtIndex:i];
    }
}


-(void)braceProcessing
{
    int lengthOfOperations = [[_calcModel stackOfOperations] count];
    int i = lengthOfOperations -1;
    ENEntities * entity = [_calcModel operationAtIndex:i];
    while ([entity priority] != BRO)
    {
        [_calcModel addInResult:entity];
        [_calcModel removeOperationAtIndex:i];
        i--;
        if (i >= 0) {
            entity = [_calcModel operationAtIndex:i];
        }else{
            break;
        }
    }
    [_calcModel removeOperationAtIndex:i];
}


-(NSString *)calculate
{
    int lengthOfStack = [[_calcModel stackOfResult] count];
    for (int i = 1; i<lengthOfStack; i++)
    {
        int operationPosition = 0;
        ENEntities * entitieOp = [_calcModel entityAtIndexOfResult:i];
        
        double result = 0;

        if ([entitieOp priority] != NONP)
        {
            ENEntities * entitieX = [_calcModel entityAtIndexOfResult:i-2];
            ENEntities * entitieY = [_calcModel entityAtIndexOfResult:i-1];
            operationPosition = i;

            int x = [[entitieX entity] integerValue];
            int y = [[entitieY entity] integerValue];
            NSLog(@"x = %d, y = %d",x,y);
            
            switch ([[entitieOp entity] characterAtIndex:0]) {
                case '+':
                    result = x+y;
                    NSLog(@"result = %f", result);
                    break;
                case '-':
                    result = x-y;
                    break;
                case '*':
                    result = x*y;
                    break;
                case '/':
                    result = (double)x/(double)y;
                    NSLog(@"result = %f", result);
                    break;
                case '^':
                    result = pow(x, y);
                    break;
                default:
                    break;
            }
            ENEntities * newEntity = [ENEntities entityWithString:[NSString stringWithFormat:@"%f", result] andPriority:NONP];
            
            NSMutableArray * arrayTemp = [NSMutableArray array];
            
            for (int i=0; i<operationPosition - 2; i++) {
                [arrayTemp addObject:[_calcModel entityAtIndexOfResult:i]];
            }
            
            [arrayTemp addObject:newEntity];
            
            for (int i = operationPosition+1; i < lengthOfStack; i++) {
                NSLog(@"!!!");
                [arrayTemp addObject:[_calcModel entityAtIndexOfResult:i]];
            }
            

            [[_calcModel stackOfResult] removeAllObjects];
            _calcModel.stackOfResult = arrayTemp;
//            NSLog(@"%@", [[_calcModel entityAtIndexOfResult:0] entity]);
            
            for (ENEntities * element in _calcModel.stackOfResult) {
                NSLog(@"element = %@", [element entity]);
            }
            lengthOfStack = [[_calcModel stackOfResult] count];
            if (lengthOfStack>1) {
                i=1;
            }
        }//if
    }
    return [[_calcModel entityAtIndexOfResult:0] entity];
}






@end

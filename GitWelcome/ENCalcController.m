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
            [_calcModel addOperation:entity];
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




@end

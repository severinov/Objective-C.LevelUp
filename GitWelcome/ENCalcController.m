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
            if ([[_calcModel operationAtIndex:(lengthOfOperations-1)] priority] > LOW) {
                //перенести все знаки в итоговый стек
            }
            [_calcModel addOperation:entity];
            break;
        case '-':
            if (lengthOfResult == 0) {return ERR;}
            if ([[_calcModel operationAtIndex:(lengthOfOperations-1)] priority] > LOW) {
                //перенести все знаки в итоговый стек
            }
            [_calcModel addOperation:entity];
            break;
        case '*':
            if (lengthOfResult == 0) {return ERR;}
            if ([[_calcModel operationAtIndex:(lengthOfOperations-1)] priority] > NORM) {
                //перенести все знаки в итоговый стек
            }
            [_calcModel addOperation:entity];
            break;
        case '/':
            if (lengthOfResult == 0) {return ERR;}
            if ([[_calcModel operationAtIndex:(lengthOfOperations-1)] priority] > NORM) {
                //перенести все знаки в итоговый стек
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
    
    
    return DONE;
}





@end

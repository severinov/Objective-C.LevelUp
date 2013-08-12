//
//  ENCalcController.m
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import "ENCalcController.h"

#define DONE   0 //Done without errors
#define ERROR -1 //Error


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
-(int)readString:(NSString *)string
{
    int stringLenght = [string length];
    unichar character;
    int resultPosition = 0;
    int stackPosition = 0;
    BOOL stateNegate = NO;
    
    //если длина строки нулевая
    //то нечего вычислять
    if (stringLenght < 1)
    {
        return ERROR;
    }
    
    //перебор символов строки
    for (int i = 0; i < stringLenght; i++)
    {
        character = 0;
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
                break;
            case '(':
                break;
            case ')':
                break;
            case '+':
                break;
            case '-':

                break;
            case '*':
                break;
            case '/':
                break;
                
            default:
                return ERROR;
                break;
        }
    }
    
    
    return DONE;
}

@end

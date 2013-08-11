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
        character = [string characterAtIndex:i];
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
                if (stateNegate)
                {
                    resultPosition--;
                    [_calcModel insertResult:[NSString stringWithCharacters:('-' + &character) length:2] atIndex:resultPosition];
                    stateNegate = NO;
                    printf("%c", [_calcModel resultAtIndex:resultPosition]);
                    break;
                }
                [_calcModel addResult:[NSString stringWithCharacters:&character length:1]];
                resultPosition++;
                break;
            case '(':
                [_calcModel insertOperation:@"(" atIndex:stackPosition];
                stackPosition++;
                break;
            case ')':
                [_calcModel insertOperation:@")" atIndex:stackPosition];
                stackPosition++;
                break;
            case '+':
                [_calcModel insertOperation:@"+" atIndex:stackPosition];
                stackPosition++;
                break;
            case '-':
                if (resultPosition == 0)
                {
                    [_calcModel addResult:[NSString stringWithCharacters:&character length:1]];
                    stateNegate = YES;
                    resultPosition++;
                    break;
                }
                [_calcModel insertOperation:@"-" atIndex:stackPosition];
                stackPosition++;
                break;
            case '*':
                if ([[_calcModel operationAtIndex:(stackPosition - 1)] isEqual: @"*"]) //создание степени
                {
                    [_calcModel insertOperation:@"**" atIndex:(stackPosition - 1)];
                    break;
                }
                [_calcModel insertOperation:@"*" atIndex:stackPosition];
                stackPosition++;
                break;
            case '/':
                [_calcModel insertOperation:@"/" atIndex:stackPosition];
                stackPosition++;
                break;
                
            default:
                return ERROR;
                break;
        }
    }
    
    
    return DONE;
}

@end

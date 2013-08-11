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
            case '1':
                printf("1\n");
                break;
                
            default:
                break;
        }
    }
    
    
    return DONE;
}

@end

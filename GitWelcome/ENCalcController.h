//
//  ENCalcController.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENCalcModel.h"

@interface ENCalcController : NSObject

@property BOOL negate;
//следующая переменная для того, чтобы отслеживать
//был ли последний добавленый в результирующую строку элемент цифрой
@property BOOL lastWasDigit;
@property ENCalcModel * calcModel;

-(void)readInput:(ENEntities *)entity;
-(void)operationProcessingWithEntity:(ENEntities*)entity;
-(void)braceProcessing;
-(int)makeExpression;
-(void)calculate;
-(void)backspace;
-(void)clear;

@end

//  RPNExpression.m
//  RPN
//
//  Created by Aleksandr Skorokhodov on 13.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNExpression.h"

@implementation RPNExpression


/*!
 @method initWithString
 @abstract Конструктор. Класса выражение в ОПН
 @param _expression выражение в ОПН 
 (разделитель символов - пробел. разбирает операции + - * /)
 */
- (id)initWithString:(NSString *)_expression {
	self = [super init];
	if (self != nil) {
		self.expression = _expression;
        self.data = (NSMutableArray *)[self.expression componentsSeparatedByString:@" "];
        [self.data removeObject:@""];
        NSLog(@"%@", self.data);
        operations = [[NSArray alloc] initWithObjects:@"+",@"-", @"*", @"/" ,nil];
	}
	return self;
}


- (id)init {
	self = [super init];
	if (self != nil) {
		self.expression = nil;
        self.data = nil;
        operations = [[NSArray alloc] initWithObjects:@"+",@"-", @"*", @"/" ,nil];
	}
	return self;
}



- (NSString *)description
{
    return [NSString stringWithFormat:@"\nRPN expression: %@\n", self.expression];
}

/*!
 @method calculate
 @abstract Вычисляет значение выражения в ОПН
 @return Возвращает NSNumber или nil если в записи выражения есть ошибки
 */
- (NSNumber*) calculate {
    NSMutableArray* stack = [NSMutableArray arrayWithCapacity:1];
    for (NSString* currentString in self.data)
    {
        if( [operations containsObject:currentString]) {
            NSString* op2 = [stack lastObject  ];
            [stack removeLastObject];
            NSString* op1 = [stack lastObject  ];
            [stack removeLastObject];
            NSNumber* res = [self opWithOperand1:op1 Operand2:op2 Operation:currentString];
            if (res == nil) {
                NSLog(@"Ошибка: неправильный формат выражения в Обратной Польской Нотации");
                return nil;
            }
            [stack addObject:res];
            NSLog(@"%@%@%@ = %@", op1, currentString,op2, res);
        } else{
            [stack addObject:currentString];
        }
        
    }
    return [NSNumber numberWithFloat:[[stack lastObject] floatValue]];
}


- (NSNumber*) opWithOperand1:(NSString*) _operand1 
                    Operand2:(NSString*) _operand2 
                   Operation:(NSString*) _operation {
    if (_operand1 == nil || _operand2 == nil) {
        NSLog(@"ошибка");
        return nil;
    }
    float v= 0;
    float op1 = [_operand1 floatValue];
    float op2 = [_operand2 floatValue];
    if ( [_operation isEqualToString:@"+"] ) {
        v = op1 + op2;
    } else if ([_operation isEqualToString:@"-"]) {
        v = op1 - op2;
    } else if ([_operation isEqualToString:@"*"]) {
        v = op1 * op2;
    } else if ([_operation isEqualToString:@"/"]) {
        v = op1 / op2;
    }
    return [NSNumber numberWithFloat:v];
}
@end

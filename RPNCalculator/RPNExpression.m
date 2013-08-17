//  RPNExpression.m
//  RPN
//
//  Created by Aleksandr Skorokhodov on 13.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNExpression.h"

@implementation RPNExpression


static NSArray* operations = nil;

+ (void)operations {
    if (!operations) {
        operations = [[NSArray alloc] initWithObjects:@"+",@"-", @"*", @"/", nil];
    }
}

/*!
 @method initWithString
 @abstract Конструктор. Класса выражение в ОПН
 @param _expression выражение в ОПН 
 (разделитель символов - пробел. разбирает операции + - * /)
 */
- (id)initWithString:(NSString *)_stringExpression {
	self = [super init];
	if (self != nil) {
        [RPNExpression operations];
		self.expression = _stringExpression;
        self.data = (NSMutableArray *)[self.expression componentsSeparatedByString:@" "];
        [self.data removeObject:@""];
        NSLog(@"data %@", self.data);
	}
	return self;
}



- (id)init {
	self = [super init];
	if (self != nil) {
        [RPNExpression operations];
		self.expression = nil;
        self.data = nil;
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
    NSLog(@"data %@", self.data);
    for (int i=0; i<[self.data count]; i++)
    {
        NSString* currentString = [self.data objectAtIndex:i];
        NSLog(@"current item: %@ stack %@", currentString, stack);
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
    if( [stack count] !=1 ) {
        NSLog(@"Неправильный формат выражения в ОПН %@" , stack);
        return nil;
    }
    NSNumber* ret = [NSNumber numberWithFloat:[[stack lastObject] floatValue]];
    NSLog(@"return %@", ret);
    return ret;
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

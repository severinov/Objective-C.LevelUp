//
//  ENCalcModel.m
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import "ENCalcModel.h"

@implementation ENCalcModel



- (id)init
{
    self = [super init];
    if (self) {
        _stackOfDigits      = [[NSMutableArray alloc] init];
        _stackOfOperations  = [[NSMutableArray alloc] init];
        _stackOfResult      = [[NSMutableString alloc] init];
    }
    return self;
}


-(void)insertDigit:(id)digit atIndex:(NSUInteger)index
{
    [_stackOfDigits insertObject:digit atIndex:index];
}
-(id)digitAtIndex:(NSUInteger)index
{
    return [_stackOfDigits objectAtIndex:index];
}


-(void)insertOperation:(id)operation atIndex:(NSUInteger)index
{
    [_stackOfDigits insertObject:operation atIndex:index];
}
-(id)operationAtIndex:(NSUInteger)index
{
    return [_stackOfOperations objectAtIndex:index];
}


-(void)insertResult:(id)result atIndex:(NSUInteger)index
{
        [_stackOfDigits insertObject:result atIndex:index];
}
-(unichar)resultAtIndex:(NSUInteger)index
{
    return [_stackOfResult characterAtIndex:index];
}



@end

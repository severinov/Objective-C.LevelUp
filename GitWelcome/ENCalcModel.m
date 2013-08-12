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
        _stackOfResult      = [[NSMutableArray alloc] init];
        _stackOfOperations  = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)insertInResult:(id)digit atIndex:(NSUInteger)index
{
    [_stackOfResult insertObject:digit atIndex:index];
}
-(void)addInResult:(id)digit
{
    [_stackOfResult addObject:digit];
}
-(id)digitAtIndexOfResult:(NSUInteger)index
{
    return [_stackOfResult objectAtIndex:index];
}


-(void)insertOperation:(id)operation atIndex:(NSUInteger)index
{
    [_stackOfResult insertObject:operation atIndex:index];
}
-(id)operationAtIndex:(NSUInteger)index
{
    return [_stackOfOperations objectAtIndex:index];
}


@end

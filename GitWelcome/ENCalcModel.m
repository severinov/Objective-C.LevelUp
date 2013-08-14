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


-(void)insertInResult:(ENEntities *)digit atIndex:(NSUInteger)index
{
    [_stackOfResult insertObject:digit atIndex:index];
}
-(void)addInResult:(ENEntities *)entity
{
    [_stackOfResult addObject:entity];
}
-(id)digitAtIndexOfResult:(NSUInteger)index
{
    return [_stackOfResult objectAtIndex:index];
}


-(void)insertOperation:(ENEntities *)operation atIndex:(NSUInteger)index
{
    [_stackOfOperations insertObject:operation atIndex:index];
}
-(void)addOperation:(ENEntities *)operation
{
    [_stackOfOperations addObject:operation];
}
-(void)removeOperationAtIndex:(int)index
{
    [_stackOfOperations removeObjectAtIndex:index];
}

-(ENEntities *)operationAtIndex:(NSUInteger)index
{
    return [_stackOfOperations objectAtIndex:index];
}


@end

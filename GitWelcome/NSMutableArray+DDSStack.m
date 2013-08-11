//
//  NSMutableArray+DDSStack.m
//  GitWelcome
//
//  Created by Yevgen Iliashchienko on 8/11/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import "NSMutableArray+DDSStack.h"

@implementation NSMutableArray (DDSStack)

-(void) push:(id)itemToPush
{
    [self insertObject: itemToPush
               atIndex:0];
}

-(id) pop
{
    if ([self count] != 0)
    {
        id objectToReturn = [self objectAtIndex:0];
        [self removeObjectAtIndex:0];
        return objectToReturn;
    }
    else return nil;
}

-(id) peek
{
    return [self objectAtIndex:0];
}
@end

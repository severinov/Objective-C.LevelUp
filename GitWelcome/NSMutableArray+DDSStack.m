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
    [self addObject: itemToPush];
    
    if ([self count] > 1)
    {
        id temp = [self lastObject];
        
        for (int i = [self count] - 1; i > 0; i--)
        {
            [self replaceObjectAtIndex:i
                            withObject:[self objectAtIndex:i - 1]];
            
        }
        [self replaceObjectAtIndex:0
                        withObject:temp];
    }
    else
        [self addObject:@"_"];
}

-(id) pop
{
    if ([self count] == 0)
        return nil;
    
    id objectToReturn = [self objectAtIndex:0];
    
    if ([self count] > 2)
    {
        for (int i = 0; i < [self count] - 1; i++)
        {
            [self replaceObjectAtIndex:i
                            withObject:[self objectAtIndex:i + 1]];
        }
        
        [self removeLastObject];
    }
    else if ([self count] == 2)
    {
        [self replaceObjectAtIndex:0
                        withObject:[self objectAtIndex:1]];
        [self removeLastObject];
    }
    else
        [self replaceObjectAtIndex:[self count] - 1
                        withObject:@"_"];
    
    return objectToReturn;
}

-(id) peek
{
    return [self objectAtIndex:0];
}
@end

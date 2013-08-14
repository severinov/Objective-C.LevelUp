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
    if (!itemToPush)
        return;
        
    [self addObject: itemToPush];
    
    if ([self count] > 1)
    {
        id temp = [self lastObject];
        
        for (int i = [self count] - 1; i > 0; i--)
            [self replaceObjectAtIndex:i
                            withObject:[self objectAtIndex:i - 1]];

        [self replaceObjectAtIndex:0
                        withObject:temp];
    }
}

-(id) pop
{
     if ([self isEmpty])
         return nil;
    
    id objectToReturn = [[self objectAtIndex:0] copy];
    
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
        [self removeAllObjects];
    
    return objectToReturn;
}

-(id) peek
{
    if ([self isNotEmpty])
        return [self objectAtIndex:0];
    else
        return nil;
}

-(BOOL) isEmpty
{
    if ([self count] == 0)
        return YES;
    else
        return NO;

}

-(BOOL) isNotEmpty
{
    if ([self count] > 0)
        return YES;
    else
        return NO;
}

-(BOOL) stackPeekIs:(NSString *)itemToCompare
{
    if (!itemToCompare)
        return NO;
    
    if ([[self peek] isEqualToString:itemToCompare])
        return YES;
    else
        return NO;
}

-(BOOL) stackPeekIsNot:(NSString *)itemToCompare
{
    if (!itemToCompare)
        return NO;
    
    if (![[self peek] isEqualToString:itemToCompare])
        return YES;
    else
        return NO;
}
@end

//
//  ENEntities.m
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/13/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import "ENEntities.h"

@implementation ENEntities


+(ENEntities *)entityWithString:(NSString *)string andPriority:(int)priority
{
    ENEntities * entityTemp = [[ENEntities alloc] init];
    [entityTemp setString:string];
    [entityTemp setPriority:priority];
    return entityTemp;
}

- (id)init
{
    self = [super init];
    if (self) {
        _string = @"";
        _priority = DON;
    }
    return self;
}

@end

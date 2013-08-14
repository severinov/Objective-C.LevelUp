//
//  ENEntities.h
//  GitWelcome
//
//  Created by Vitaliy Babich on 8/13/13.
//  Copyright (c) 2013 Nikita Severinov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ERR    -1
#define DON     0
#define BRO     1
#define BRC     2
#define LOW     3
#define NORM    4
#define HI      5
#define NONP   -2

@interface ENEntities : NSObject

@property NSString * entity;
@property int priority;

+(ENEntities *)entityWithString:(NSString *)entity andPriority:(int)priority;


@end
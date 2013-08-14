//
//  RPNParser.m
//  RPN
//
//  Created by Aleksandr Skorokhodov on 13.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNParser.h"


@implementation RPNParser

static RPNParser *_sharedInstance = nil;
static NSArray* operations = nil; 


/*!
 @method sharedInstance
 @abstract Singleton.
 */
+ (RPNParser *)sharedInstance {
	@synchronized(self)
	{
		if (!_sharedInstance) {
			_sharedInstance = [[RPNParser alloc] init];
            operations = [[NSArray alloc] initWithObjects:@"+",@"-", @"*", @"/" ,nil];
		}
	}
	return _sharedInstance;
}



/*!
 @method parseWithExpression
 @adstract парсит строку с арифметическим выражением
 */
- (RPNExpression *)parseWithExpression: (NSString*)_expression {
    NSLog( [NSString stringWithFormat: @"parse to RPN\n %@", _expression]);
    
    outString = [NSMutableArray arrayWithCapacity:1];
    stack = [NSMutableArray arrayWithCapacity:1];
    
    NSString* previousSymbol = nil;
    for(int i = 0 ; i < [_expression length]; i++) {
        if(i > 0) {
            previousSymbol = [NSString stringWithFormat: @"%c" ,[_expression characterAtIndex:i-1] ];
        }
        NSLog(@"char %c", [_expression characterAtIndex:i]);
        NSString* str = [NSString stringWithFormat: @"%c" ,[_expression characterAtIndex:i] ];
        if ( [str isEqualToString: @" "]) {
            continue;
        }
        if( [str isEqualToString: @"("] ) {
            [stack addObject:str];
        } else if( [str isEqualToString: @")"] ) {
            [self addBracketToStack];
        } else if( [operations containsObject: str ] ) {
            if ( [str isEqualToString:@"-"] && ( 
                                                previousSymbol == nil || 
                                                [previousSymbol isEqualToString:@"("] ||
                                                [operations containsObject: previousSymbol ]) )
            { // это унарный минус
                // надо добавить его к числу
                [outString addObject: str];
                continue;
            }
            [self addOperationToStack: str];
            [outString addObject:@" "];
        } else {
            [outString addObject: str];
        }
    }
    [self clearStack];
    
    RPNExpression* expression = [[RPNExpression alloc] initWithString:[ outString componentsJoinedByString:@""]];
    return expression;
}

- (void) clearStack {
    while( [stack count] > 0 ) {
        NSString* obj = [stack lastObject];
        [stack removeLastObject];
        [outString addObject: @" "];
        [outString addObject: obj];
    }

}

- (int) operationPriority:(NSString*) operation {
    int priority = 0;
    if( [operation isEqualToString:@"-"] ) {
        priority = 1;
    } else if ( [operation isEqualToString:@"+"] ) {
        priority = 1;
    } else if ( [operation isEqualToString:@"*"] ) {
        priority = 2;
    } else if ( [operation isEqualToString:@"/"] ) {
        priority = 2;
    }
    return priority;
}

-(void) addOperationToStack:(NSString*) operation {
    while( [stack count] > 0 ) {
        NSString* obj = [stack lastObject];
        if ( [self operationPriority:obj] >= [self operationPriority: operation]) {
            [stack removeLastObject];
            [outString addObject: @" "];
            [outString addObject: obj];
            [outString addObject: @" "];
        } else {
            break;
        }
    }
    [stack addObject: operation];
    
}

- (void) addBracketToStack {
    while( [stack count] > 0) {
        NSString* obj = [stack lastObject];
        if ( ! [obj isEqualToString: @"("] ) {
            [stack removeLastObject];
            [outString addObject: @" "];
            [outString addObject: obj];
            [outString addObject: @" "];
        } else {
            [stack removeLastObject];
            break;
        }
    }

}
@end

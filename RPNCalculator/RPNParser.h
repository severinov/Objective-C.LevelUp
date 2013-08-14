//
//  RPNParser.h
//  RPN
//
//  Created by Aleksandr Skorokhodov on 13.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPNExpression.h"

@interface RPNParser : NSObject
{
    NSMutableArray* outString; 
    NSMutableArray* stack;
    
}


- (RPNExpression *)parseWithExpression:(NSString *)_expresson;


+ (RPNParser *)sharedInstance;

@end

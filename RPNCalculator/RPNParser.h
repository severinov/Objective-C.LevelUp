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


- (RPNExpression *)parseToRPNWithExpression:(NSString *)_expresson;
- (NSString *)parseToStringWithExpression:(NSString *)_expresson;


+ (RPNParser *)sharedInstance;

@end

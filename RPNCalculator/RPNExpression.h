//
//  RPNExpression.h
//  RPN
//
//  Created by Aleksandr Skorokhodov on 13.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPNExpression : NSObject


@property NSString *expression;
@property NSMutableArray *data;


- (id)initWithString:(NSString *)_expression;
- (id)init;

- (NSNumber*)calculate;
@end

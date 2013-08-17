//
//  RPNCalculatorTest.m
//  RPNCalculatorTest
//
//  Created by Aleksandr Skorokhodov on 16.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNCalculatorTest.h"


@implementation RPNCalculatorTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void) initExamples {
    examples = [NSArray arrayWithObjects: @"1 2 3 + +",
                @"1 2 + 3 +",
                @"5 4 + 8 - 5 -",
                @"1 2 +",
                @"-1 2 +",
                @"1 2 -",
                @"1 2.5 -",
                @"4 6 *",
                @"4 -6 *",
                @"25 5 /",
                @"15 -5 /",
                nil
                ];
    results = [NSArray arrayWithObjects: @"6",
               @"6",
               @"-4",
               @"3",
               @"1",
               @"-1",
               @"-1.5",
               @"24",
               @"-24",
               @"5",
               @"-3",
               nil ];
    
}

- (void) initWrongExamples {
    examples = [NSArray arrayWithObjects: @"1 2 3 +",
                @"1 2 + +",
                @"5 4 + - 5 -",
                @"1 2",
                @"1 + 2",
                @"1 +2",
                @"-1 +2",
                @"-1 2",
                @"1 2 %",
                @"1 *2 ",
                @"1 +",
                nil
                ];
}


- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    [self initExamples];
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    for(int i = 0; i < [examples count]; i ++) {
        NSNumber *ret = [f numberFromString: [results objectAtIndex:i]];    
        
        NSString *example = [ NSString stringWithFormat:@"%@", [examples objectAtIndex:i]]; 
        NSLog(@"test %@ = %@", example, ret); 
        RPNExpression* e = [[RPNExpression alloc ]initWithString: example];
        NSNumber *n = [e calculate];
        NSLog(@"we get %@", n); 
        
        STAssertEqualObjects( n, ret, @"%@ = %@ but we get %@" , example, ret , n );
    }
}

- (void)testErrorExamples {
    
    [self initWrongExamples];
    
    for (NSString* example in examples) {    
        RPNExpression* e = [[RPNExpression alloc ]initWithString: example];
        NSNumber *n = [e calculate];
        STAssertNil( n , @"%@ ", example);
    }
}
@end

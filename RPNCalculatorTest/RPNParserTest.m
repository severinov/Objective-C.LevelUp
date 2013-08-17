//
//  RPNParserTest.m
//  RPNCalculator
//
//  Created by Aleksandr Skorokhodov on 18.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNParserTest.h"

@implementation RPNParserTest

- (void)setUp
{
    [super setUp];
}
- (void)tearDown
{
    [super tearDown];
}


- (void) initExamples {
    examples = [NSArray arrayWithObjects: @"1+2",
                @"-1+2",
                @"1-2",
                nil];
       
    results = [NSArray arrayWithObjects: @"1 2 +",
               @"-1 2 +",
               @"1 2 -",
               nil];

}             




- (void)testParse
{
    [self initExamples];
    
    for(int i = 0; i < [examples count]; i ++) {
        NSString *result = [ NSString stringWithFormat:@"%@", [results objectAtIndex:i]]; 
        NSString *example = [ NSString stringWithFormat:@"%@", [examples objectAtIndex:i]]; 
        NSLog(@"test %@ -> %@", example, result); 
        
        NSString *value = [[RPNParser sharedInstance] parseToStringWithExpression:example ];
        
        STAssertEqualObjects( result, value, nil );
    }
    
}

@end

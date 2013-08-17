//
//  RPNViewController.m
//  RPNCalculator
//
//  Created by Aleksandr Skorokhodov on 14.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "RPNViewController.h"

@interface RPNViewController ()

@end

@implementation RPNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCalculate:(id)sender {
    if ([_expression.text length] == 0 ) {
        _result.text = @"напишите арифметическое выражение";
    } else {
        RPNExpression* expr = [[RPNParser sharedInstance] parseToRPNWithExpression:_expression.text];
        _result.text = [NSString stringWithFormat:@"%@", [expr calculate] ];
    }
    [_expression resignFirstResponder];
}
@end

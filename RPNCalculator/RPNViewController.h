//
//  RPNViewController.h
//  RPNCalculator
//
//  Created by Aleksandr Skorokhodov on 14.08.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPNViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *expression;
@property (weak, nonatomic) IBOutlet UILabel *result;
- (IBAction)startCalculate:(id)sender;

@end

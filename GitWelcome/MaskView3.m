//
//  MaskView3.m
//  testCLC
//
//  Created by Alexander on 12.08.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "MaskView3.h"

@implementation MaskView3

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.341 green: 0.339 blue: 0.41 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.307 green: 0.348 blue: 0.515 alpha: 0.301];
    
    //// Frames
    CGRect frame3 = CGRectMake(0, 0, 320, 460);
    
    
    //// Group 3
    {
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame3) + 251.5, CGRectGetMinY(frame3) + 349, 64.5, 101) cornerRadius: 4];
        [gradientColor setFill];
        [roundedRectangle2Path fill];
        [strokeColor setStroke];
        roundedRectangle2Path.lineWidth = 1;
        [roundedRectangle2Path stroke];
    }
}

@end

//
//  MaskView2.m
//  testCLC
//
//  Created by Alexander on 12.08.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "MaskView2.h"

@implementation MaskView2

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.341 green: 0.339 blue: 0.41 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.678 green: 0.739 blue: 0.919 alpha: 0.239];
    
    //// Frames
    CGRect frame2 = CGRectMake(0, 0, 320, 460);
    
    
    //// Group 2
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame2) + 252, CGRectGetMinY(frame2) + 93, 64.5, 256.5) cornerRadius: 4];
        [gradientColor setFill];
        [roundedRectanglePath fill];
        [strokeColor setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
    }
}

@end

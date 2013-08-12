//
//  MaskView.m
//  testCLC
//
//  Created by Alexander on 12.08.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "MaskView1.h"

@implementation MaskView1

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.341 green: 0.339 blue: 0.41 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 0.307 green: 0.348 blue: 0.515 alpha: 0.301];
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 320, 460);
    
    
    //// Group
    {
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 6, CGRectGetMinY(frame) + 128.5, 235.5, 316.5) cornerRadius: 4];
        [color setFill];
        [roundedRectangle3Path fill];
        [strokeColor setStroke];
        roundedRectangle3Path.lineWidth = 1;
        [roundedRectangle3Path stroke];
    }
}

@end

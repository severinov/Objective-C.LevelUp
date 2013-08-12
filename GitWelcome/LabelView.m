//
//  LabelView.m
//  testCLC
//
//  Created by Alexander on 11.08.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "LabelView.h"

@implementation LabelView

@synthesize enable;

- (void)drawRect:(CGRect)rect
{
    [super drawRect: rect];
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0];
    UIColor* strokeColor;
    UIColor* color;
    
    if (enable) {
        strokeColor = [UIColor redColor];
        color = [UIColor redColor];
    } else {
        strokeColor = [UIColor colorWithRed: 0.057 green: 0.392 blue: 0.947 alpha: 0.724];
        color = [UIColor colorWithRed: 0.057 green: 0.392 blue: 0.947 alpha: 1];
    }
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Group
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 0.5, CGRectGetWidth(frame) - 1, CGRectGetHeight(frame) - 1) cornerRadius: 4];
        [fillColor setFill];
        [roundedRectanglePath fill];
        
        ////// Rounded Rectangle Inner Shadow
        CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -shadowBlurRadius, -shadowBlurRadius);
        roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -shadowOffset.width, -shadowOffset.height);
        roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1, -1);
        
        UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
        [roundedRectangleNegativePath appendPath: roundedRectanglePath];
        roundedRectangleNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadowOffset.width + round(roundedRectangleBorderRect.size.width);
            CGFloat yOffset = shadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadowBlurRadius,
                                        shadow.CGColor);
            
            [roundedRectanglePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0);
            [roundedRectangleNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [roundedRectangleNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [strokeColor setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
        CGContextRestoreGState(context);
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"numberLabel" object:[NSNumber numberWithInt:self.tag]];
}

@end

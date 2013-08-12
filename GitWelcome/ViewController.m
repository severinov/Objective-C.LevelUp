
#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

@synthesize maskStack, numberMaskOfStack, labelView, label0, label1, label2, label3;

- (void)viewDidLoad
{
    [super viewDidLoad];
    maskStack = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        UIView *mask;
        switch (i) {
            case 0:
                mask = [[MaskView1 alloc] initWithFrame:self.view.frame];
                break;
            case 1:
                mask = [[MaskView2 alloc] initWithFrame:self.view.frame];
                break;
            case 2:
                mask = [[MaskView3 alloc] initWithFrame:self.view.frame];
                break;
            default:
                break;
        }
        [mask setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.0]];
        [mask setUserInteractionEnabled:NO];
        [mask setTransform:CGAffineTransformMakeTranslation(0, -20)];
        [mask setAlpha:0.0];
        [self.view addSubview:mask];
        [maskStack addObject:mask];
    }
    
    [self.view setAlpha:0.0];
    [UIView animateWithDuration:1 animations:^() {
        [self.view setAlpha:1.0];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableButton:) name:@"numberLabel" object:NULL];
}

- (void)enableButton:(NSNotification *)notification {
    for (int i = 0; i < 3; i++) {
        [UIView animateWithDuration:0.1 animations:^() {
            [[maskStack objectAtIndex:i] setAlpha:0.0];
        }];
    }
    if ([[notification object] integerValue] == 0) {
        [UIView animateWithDuration:0.2 animations:^() {
            [[maskStack objectAtIndex:0] setAlpha:1.0];
        }];
        labelView = label0;
        [label0 setEnable:YES];
        [label1 setEnable:NO];
        [label2 setEnable:NO];
        [label3 setEnable:NO];
    } else if ([[notification object] integerValue] == 1) {
        [UIView animateWithDuration:0.2 animations:^() {
            [[maskStack objectAtIndex:1] setAlpha:1.0];
        }];
        labelView = label1;
        [label0 setEnable:NO];
        [label1 setEnable:YES];
        [label2 setEnable:NO];
        [label3 setEnable:NO];
    } else if ([[notification object] integerValue] == 2) {
        [UIView animateWithDuration:0.2 animations:^() {
            [[maskStack objectAtIndex:0] setAlpha:1.0];
        }];
        labelView = label2;
        [label0 setEnable:NO];
        [label1 setEnable:NO];
        [label2 setEnable:YES];
        [label3 setEnable:NO];
    } else if ([[notification object] integerValue] == 3) {
        [UIView animateWithDuration:0.2 animations:^() {
            [[maskStack objectAtIndex:2] setAlpha:1.0];
        }];
        labelView = label3;
        [label0 setEnable:NO];
        [label1 setEnable:NO];
        [label2 setEnable:NO];
        [label3 setEnable:YES];
    }
    [label0 setNeedsDisplay];
    [label1 setNeedsDisplay];
    [label2 setNeedsDisplay];
    [label3 setNeedsDisplay];
    numberMaskOfStack = [[notification object] integerValue];
}


- (IBAction)button0:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"0"];
    }
}

- (IBAction)button1:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"1"];
    }
}

- (IBAction)button2:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"2"];
    }
}

- (IBAction)button3:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"3"];
    }
}

- (IBAction)button4:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"4"];
    }
}

- (IBAction)button5:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"5"];
    }
}

- (IBAction)button6:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"6"];
    }
}

- (IBAction)button7:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"7"];
    }
}

- (IBAction)button8:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"8"];
    }
}

- (IBAction)button9:(id)sender {
    if (numberMaskOfStack == 0 || numberMaskOfStack == 2) {
        [labelView setText:@"9"];
    }
}

- (IBAction)button10:(id)sender {
    if (numberMaskOfStack == 1) {
        [labelView setText:@"÷"];
    }
}

- (IBAction)button11:(id)sender {
    if (numberMaskOfStack == 1) {
        [labelView setText:@"×"];
    }
}

- (IBAction)button12:(id)sender {
    if (numberMaskOfStack == 1) {
        [labelView setText:@"−"];
    }
}

- (IBAction)button13:(id)sender {
    if (numberMaskOfStack == 1) {
        [labelView setText:@"+"];
    }
}

- (IBAction)button14:(id)sender {
    if (numberMaskOfStack == 3) {
        if ([label1.text isEqualToString:@"÷"]) {
            [labelView setText:[NSString stringWithFormat:@"%0.1f", [label0.text floatValue] / [label2.text floatValue]]];
        } else if ([label1.text isEqualToString:@"×"]) {
            [labelView setText:[NSString stringWithFormat:@"%g", [label0.text floatValue] * [label2.text floatValue]]];
        } else if ([label1.text isEqualToString:@"−"]) {
            [labelView setText:[NSString stringWithFormat:@"%g", [label0.text floatValue] - [label2.text floatValue]]];
        } else if ([label1.text isEqualToString:@"+"]) {
            [labelView setText:[NSString stringWithFormat:@"%g", [label0.text floatValue] + [label2.text floatValue]]];
        }
    }
}

@end

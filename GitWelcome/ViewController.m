
#import "ViewController.h"

@interface ViewController()
@property (nonatomic) BOOL areWeInTheMiddleOfEnteringNumber;
@end

@implementation ViewController

@synthesize display = _display;

- (IBAction)digitPressed:(id)sender
{
    NSLog(@"digit pressed = %@", [sender currentTitle]);
    
    NSString *digit = [sender currentTitle];
    
    if (self.areWeInTheMiddleOfEnteringNumber)
        self.display.text = [self.display.text stringByAppendingString:digit];
    else
    {
        if ([digit isEqualToString:@"0"])
            return; //Several zero at begining is not allowed
        else if ([digit isEqualToString:@"."])
        {
            self.display.text = [self.display.text stringByAppendingString:digit];
            return;
        }
        else self.display.text = digit;
        
        self.areWeInTheMiddleOfEnteringNumber = YES;
    }
}

- (IBAction)operationPressed:(id)sender
{
}

- (IBAction)enterPressed
{
}

- (IBAction)clearPressed
{
    self.areWeInTheMiddleOfEnteringNumber = NO;
    self.display.text = @"0";
}

@end


#import "ViewController.h"
#import "NSMutableArray+DDSStack.h"

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
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        if ([digit isEqualToString:@"0"])
            return; //Several zero at begining is not allowed
        else if ([digit isEqualToString:@"."]) //Zero before point. 
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
    NSLog(@"operation pressed = %@", [sender currentTitle]);
    
    NSString *operation = [sender currentTitle];
    
    self.display.text = [self.display.text stringByAppendingString:operation];
}

- (IBAction)enterPressed
{

}

- (IBAction)clearPressed
{
    self.areWeInTheMiddleOfEnteringNumber = NO;
    self.display.text = @"0";
}

- (IBAction)delPressed
{
    if ([self.display.text length] > 1)
        self.display.text = [self.display.text substringToIndex:[self.display.text length] -1];
    else 
        [self clearPressed];
}

@end

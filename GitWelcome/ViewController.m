
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
            self.areWeInTheMiddleOfEnteringNumber = YES;
            return;
        }
        else self.display.text = digit;
        
        self.areWeInTheMiddleOfEnteringNumber = YES;
    }
}

- (IBAction)enterPressed
{
//    NSString *outputString = [[NSString alloc] init];
//    NSMutableArray *operandStack = [[NSMutableArray alloc] init];

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

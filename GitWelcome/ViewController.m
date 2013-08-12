
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
    NSMutableArray *outputStack = [[NSMutableArray alloc] init];
    NSMutableArray *outputString = [[NSMutableArray alloc] init];
    NSSet *digits = [[NSSet alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @".", nil];
    NSSet *lowPriorityOperands = [[NSSet alloc] initWithObjects:@"-", @"+", nil];
    NSSet *normalPriorityOperands = [[NSSet alloc] initWithObjects:@"/", @"*", nil];
    NSString *tempString = [[NSString alloc] init];
    NSString *sourceString = [[NSString alloc] initWithString:[self.display.text stringByAppendingString:@"_"]];
    
    
    for (int i = 0; i < [sourceString length]; i++)
    {
        NSString *currentCharacter = [[NSString alloc] initWithFormat:@"%c", [sourceString characterAtIndex:i]];
        
        if ([digits containsObject:currentCharacter])
        {
            tempString = [tempString stringByAppendingString:currentCharacter];
        }
        
        if ( (([normalPriorityOperands containsObject:currentCharacter]) ||
              ([lowPriorityOperands containsObject:currentCharacter]) ||
              ([currentCharacter isEqualToString:@"("]) ||
              ([currentCharacter isEqualToString:@")"]) ||
              (i == [sourceString length] - 1)) &&
             (([tempString length] > 0)) )
        {
            [outputString addObject:[NSNumber numberWithFloat:[tempString floatValue]]];
            tempString = @"";
        }
        
        if ([currentCharacter isEqualToString:@"("])
            [outputStack push:currentCharacter];
        
        if ([currentCharacter isEqualToString:@")"])
        {
            while (![[outputStack peek] isEqualToString:@"("])
                [outputString addObject:[outputStack pop]];
            [outputStack pop];
        }
        
        if ([lowPriorityOperands containsObject:currentCharacter])
        {
            if ([outputStack count] > 0)
                if (![[outputStack peek] isEqualToString:@"("])
                    while (([normalPriorityOperands containsObject:[outputStack peek]]) || ([lowPriorityOperands containsObject:[outputStack peek]]))
                    {
                        [outputString addObject:[outputStack pop]];
                    }
            [outputStack push:currentCharacter];
        }
        
        if ([normalPriorityOperands containsObject:currentCharacter])
        {
            if ([outputStack count] > 0)
                if (![[outputStack peek] isEqualToString:@"("])
                    while ([normalPriorityOperands containsObject:[outputStack peek]])
                    {
                        [outputString addObject:[outputStack pop]];
                    }
                [outputStack push:currentCharacter];
        }
    }

    while (![[outputStack peek] isEqual:@"_"])
        if (![[outputStack peek] isEqual:@"("])
            [outputString addObject:[outputStack pop]];
        else
            [outputStack pop];

    [outputString addObject:@"_"];
    NSMutableArray *valuesStack = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [outputString count]; i++)
    {
        if (
                [lowPriorityOperands containsObject:[outputString objectAtIndex:i]] ||
                [normalPriorityOperands containsObject:[outputString objectAtIndex:i]]
           )
        {
            
            NSString *operand = [[NSString alloc] initWithString:[outputString objectAtIndex:i]];
            
            while (!(
                     [lowPriorityOperands containsObject:[outputString peek]] ||
                     [normalPriorityOperands containsObject:[outputString peek]]
                     ))
            {
                [valuesStack push:[outputString pop]];
            }
            
            
            float rightValue = [[valuesStack pop] floatValue];
            float leftValue = [[valuesStack pop] floatValue];
            NSNumber *result = [[NSNumber alloc] init];
            
            if ([operand isEqual:@"+"])
            {
                [outputString pop];
                result = [NSNumber numberWithFloat:leftValue + rightValue];
                [valuesStack push:result];
                i = -1;
            }
            else if ([operand isEqual:@"-"])
            {
                [outputString pop];
                result = [NSNumber numberWithFloat:leftValue - rightValue];
                [valuesStack push:result];
                i = -1;
            }
            else if ([operand isEqual:@"*"])
            {
                [outputString pop];
                result = [NSNumber numberWithFloat:leftValue * rightValue];
                [valuesStack push:result];
                i = -1;
            }
            else if ([operand isEqual:@"/"])
            {
                [outputString pop];
                result = [NSNumber numberWithFloat:leftValue / rightValue];
                [valuesStack push:result];
                i = -1;
            }
            else
                return;
        }
    }
    self.display.text =  [[valuesStack peek] stringValue];
    
    [valuesStack removeAllObjects];
    [outputString removeAllObjects];
    [outputStack removeAllObjects];
    tempString = @"";
    sourceString = @"";
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

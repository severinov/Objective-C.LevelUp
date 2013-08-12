
#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController


- (void)viewDidLoad
{
        [super viewDidLoad];
      // Do any additional setup after loading the view, typically from a nib.
    
    _controller = [[ENCalcController alloc] init];
}

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}



- (void)viewDidUnload
{
    [self setFieldText:nil];

}

- (IBAction)button:(id)sender
{
}

- (IBAction)buttonOne:(id)sender
{
}

- (IBAction)buttonTwo:(id)sender
{
    
}
- (IBAction)buttonThree:(id)sender
{
    
}
- (IBAction)buttonFour:(id)sender
{
    
}
- (IBAction)buttonFive:(id)sender
{
    
}
- (IBAction)buttonSix:(id)sender
{
    
}
- (IBAction)buttonSeven:(id)sender
{
    
}
- (IBAction)buttonEight:(id)sender
{
    
}
- (IBAction)buttonNine:(id)sender
{
    
}
- (IBAction)buttonZero:(id)sender
{
    
}

- (IBAction)buttonDot:(id)sender
{
    
}
- (IBAction)buttonEqual:(id)sender
{
    
}
- (IBAction)buttonClear:(id)sender
{
    [_fieldText setText:@""];
    [_controller clear];
}

- (IBAction)buttonBraceOpen:(id)sender
{
    
}
- (IBAction)buttonBraceClose:(id)sender
{
    
}
- (IBAction)buttonPlus:(id)sender
{
    
}
- (IBAction)buttonSubstract:(id)sender
{
    
}
- (IBAction)buttonMultipy:(id)sender
{
    
}
- (IBAction)buttonDivide:(id)sender
{
    
}
- (IBAction)buttonPower:(id)sender
{
    
}




@end

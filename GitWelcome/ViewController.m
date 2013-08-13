
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


- (IBAction)buttonOne:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"1" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonTwo:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"2" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonThree:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"3" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonFour:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"4" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonFive:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"5" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonSix:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"6" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonSeven:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"7" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonEight:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"8" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonNine:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"9" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonZero:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"0" andPriority:NONP];
    [_controller readInput:ent];
}

- (IBAction)buttonDot:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"." andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonCalc:(id)sender
{
    NSString * string = @"";
    for (ENEntities * element in [_controller.calcModel stackOfResult])
    {
        string = [string stringByAppendingString:[element entity]];
    }
    [_fieldText setText:string];
}
- (IBAction)buttonClear:(id)sender
{
    [_fieldText setText:@""];
//    [_controller clear];
}

- (IBAction)buttonBackspace:(id)sender
{
    
}

- (IBAction)buttonBraceOpen:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"(" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonBraceClose:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@")" andPriority:NONP];
    [_controller readInput:ent];
}
- (IBAction)buttonPlus:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"+" andPriority:LOW];
    [_controller readInput:ent];
}
- (IBAction)buttonSubstract:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"-" andPriority:LOW];
    [_controller readInput:ent];
}
- (IBAction)buttonMultipy:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"*" andPriority:NORM];
    [_controller readInput:ent];
}
- (IBAction)buttonDivide:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"/" andPriority:NORM];
    [_controller readInput:ent];
}
- (IBAction)buttonPower:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"^" andPriority:HI];
    [_controller readInput:ent];
}




@end

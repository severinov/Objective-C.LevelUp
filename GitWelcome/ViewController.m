
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


- (IBAction)buttonPressed:(id)sender
{
    [_controller readString: [_fieldExpression text]];
}
- (void)viewDidUnload {
    [self setFieldExpression:nil];
    [self setLabelResult:nil];
    [super viewDidUnload];
}
@end

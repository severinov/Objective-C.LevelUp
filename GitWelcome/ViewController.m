
#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController


- (void)viewDidLoad
{
        [super viewDidLoad];
    
    _controller = [[ENCalcController alloc] init];
    //создаем наблюдателя за строкой модели
    [self addObserver:self forKeyPath:@"controller.calcModel.stringDisplay" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}


//метод наблюдателя
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //проверяем значение ключа, чтобы знать блин, что менять
    if ([keyPath isEqualToString:@"controller.calcModel.stringDisplay"]) {
        [_fieldText setText:[change objectForKey:NSKeyValueChangeNewKey]];
    }
}


- (void)viewDidUnload
{
    [self removeObserver:self forKeyPath:@"controller.calcModel.stringDisplay"];
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
//    [_controller compliteProcessing];

    [_fieldText setText:[_controller calculate]];
}

- (IBAction)buttonClear:(id)sender
{
    [_controller clear];
}

- (IBAction)buttonBackspace:(id)sender
{
    [_controller backspace];
}

- (IBAction)buttonBraceOpen:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@"(" andPriority:BRO];
    [_controller readInput:ent];
}
- (IBAction)buttonBraceClose:(id)sender
{
    ENEntities * ent = [ENEntities entityWithString:@")" andPriority:BRC];
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

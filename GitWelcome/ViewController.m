
#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //режим работы 0
    //означает можно работать
    _STATE = 0;
    
    _didDigit       = 0;
    _didOp          = 0;
    _didBraC        = 0;
    _didBraO        = 0;
    _countBraO      = 0;
    _countNegate    = 0;
    _countDot       = 0;
    
    _controller = [[ENCalcController alloc] init];
    //создаем наблюдателя за строкой модели
    [self addObserver:self forKeyPath:@"controller.calcModel.stringDisplay" options:NSKeyValueObservingOptionNew context:nil];
    
    _buttonEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
    [self buttonPressed:_buttonEmpty];
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
    [self setButtonEqual:nil];
    [self setButtonDivide:nil];
    [self setButtonMultiply:nil];
    [self setButtonSubstract:nil];
    [self setButtonClear:nil];
    [self setButtonBackspace:nil];
    [self setButtonBraC:nil];
    [self setButtonBraO:nil];
    [self setButtonPower:nil];
    [self setButtonZero:nil];
    [self setButtonDot:nil];
    [self setButtonNine:nil];
    [self setButtonEight:nil];
    [self setButtonSeven:nil];
    [self setButtonSix:nil];
    [self setButtonFive:nil];
    [self setButtonFour:nil];
    [self setButtonThree:nil];
    [self setButtonTwo:nil];
    [self setButtonOne:nil];
    [self removeObserver:self forKeyPath:@"controller.calcModel.stringDisplay"];
    [self setFieldText:nil];
}





- (IBAction)buttonOne:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"1" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonTwo:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"2" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonThree:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"3" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonFour:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"4" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonFive:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"5" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonSix:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"6" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonSeven:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"7" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonEight:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"8" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonNine:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"9" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonZero:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"0" andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}

- (IBAction)buttonDot:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"." andPriority:NONP];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}



- (IBAction)buttonCalc:sender
{
    //режим работы 1
    //означает начать новые вычисления
    //при нажатии любой следующей клавиши
    _STATE = 1;
    [_controller makeExpression];
    [_controller calculate];
    [self buttonPressed:sender];
}




- (IBAction)buttonClear:sender
{
    [_controller clear];
    [self buttonPressed:sender];
}

- (IBAction)buttonBackspace:sender
{
    if ([[[[[_controller calcModel] stackOfInput] lastObject] string] isEqualToString:@")"]) {
        _countBraO++;
        _buttonBraO.enabled = YES;
    }
    [_controller backspace];
    [self buttonPressed:sender];
}





- (IBAction)buttonBraceOpen:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"(" andPriority:BRO];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonBraceClose:sender
{
    ENEntities * ent = [ENEntities entityWithString:@")" andPriority:BRC];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonPlus:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"+" andPriority:LOW];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonSubstract:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"-" andPriority:LOW];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonMultipy:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"*" andPriority:NORM];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonDivide:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"/" andPriority:NORM];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}
- (IBAction)buttonPower:sender
{
    ENEntities * ent = [ENEntities entityWithString:@"^" andPriority:HI];
    [_controller readInput:ent];
    [self buttonPressed:sender];
}



-(void)buttonPressed:(UIButton *)sender
{
    unichar character = [[[sender titleLabel] text] characterAtIndex:0];
    //проверяем введнный символ и применяем правила блокировки кнопок
    switch (character)
    {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            _didDigit       = 1;
            _didOp          = 0;
            _didBraC        = 0;
            _didBraO        = 0;
            _countNegate    = 0;
            break;
        case '(':
            _didDigit       = 0;
            _didOp          = 0;
            _didBraC        = 0;
            _didBraO        = 1;
            _countBraO++;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case ')':
            _didDigit       = 0;
            _didOp          = 0;
            _didBraC        = 1;
            _didBraO        = 0;
            _countBraO--;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case '+':
            _didDigit       = 0;
            _didOp          = 1;
            _didBraC        = 0;
            _didBraO        = 0;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case '-':
            _didDigit       = 0;
            _countNegate    = _countNegate + 1 + _didOp;
            _didOp          = 1;
            _didBraC        = 0;
            _didBraO        = 0;
            _countDot       = 0;
            break;
        case '*':
            _didDigit       = 0;
            _didOp          = 1;
            _didBraC        = 0;
            _didBraO        = 0;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case '/':
            _didDigit       = 0;
            _didOp          = 1;
            _didBraC        = 0;
            _didBraO        = 0;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case '^':
            _didDigit       = 0;
            _didOp          = 1;
            _didBraC        = 0;
            _didBraO        = 0;
            _countNegate    = 0;
            _countDot       = 0;
            break;
        case '<':
            //если в модели есть что-то, то отдаем это как нажатую кнопку
            //если же она пуста, то вызываем кнопку С
            if ([[[_controller calcModel] stackOfInput] count] > 0) {
                [_buttonEmpty.titleLabel setText:[[[[_controller calcModel] stackOfInput] lastObject] string]];
            }else{
                [[_buttonEmpty titleLabel] setText:@"C"];
            }
            [self buttonPressed:_buttonEmpty];
            break;
        case 'C':
            _didDigit       = 0;
            _didOp          = 0;
            _didBraC        = 0;
            _didBraO        = 0;
            _countBraO      = 0;
            _countNegate    = 0;
            _countDot       = 0;
            [[_buttonEmpty titleLabel] setText:nil];
            [self buttonPressed:_buttonEmpty];
            break;
        default:
            break;
    }//end swich
    
    if ([[[_controller calcModel] stackOfInput] count] >0) {
        _buttonBackspace.enabled = YES;
    }else{
        _buttonBackspace.enabled = NO;
    }
    
    if (_didDigit == 1 | _didBraC == 1) {
        _buttonAdd.enabled = YES;
        _buttonMultiply.enabled = YES;
        _buttonDivide.enabled = YES;
        _buttonPower.enabled = YES;
    }else{
        _buttonAdd.enabled = NO;
        _buttonMultiply.enabled = NO;
        _buttonDivide.enabled = NO;
        _buttonPower.enabled = NO;
    }
    
    if (_countBraO == 0 && _didOp == 0) {
        _buttonEqual.enabled = YES;
    }else{
        _buttonEqual.enabled = NO;
    }
    
    if (_didDigit == 0 && _didBraC == 0) {
        _buttonBraO.enabled = YES;
    }else{
        _buttonBraO.enabled = NO;
    }
    
    if (_didOp == 0 && _countBraO > 0) {
        _buttonBraC.enabled = YES;
    }else{
        _buttonBraC.enabled = NO;
    }
    
    if (_didDigit == 1 && _countDot==0) {
        _buttonDot.enabled = YES;
    }else{
        _buttonDot.enabled = NO;
    }
    
    if (_didOp == 1 && _countNegate >= 2) {
        _buttonSubstract.enabled = NO;
    }else{
        _buttonSubstract.enabled = YES;
    }
    
    if (_didBraC == 1) {
        _buttonOne.enabled = NO;
        _buttonTwo.enabled = NO;
        _buttonThree.enabled = NO;
        _buttonFour.enabled = NO;
        _buttonFive.enabled = NO;
        _buttonSix.enabled = NO;
        _buttonSeven.enabled = NO;
        _buttonEight.enabled = NO;
        _buttonNine.enabled = NO;
        _buttonZero.enabled = NO;
    }else{
        _buttonOne.enabled = YES;
        _buttonTwo.enabled =YES;
        _buttonThree.enabled = YES;
        _buttonFour.enabled = YES;
        _buttonFive.enabled = YES;
        _buttonSix.enabled = YES;
        _buttonSeven.enabled = YES;
        _buttonEight.enabled = YES;
        _buttonNine.enabled = YES;
        _buttonZero.enabled = YES;

    }
    
    if (_STATE == 1) {
        _buttonOne.enabled = NO;
        _buttonTwo.enabled = NO;
        _buttonThree.enabled = NO;
        _buttonFour.enabled = NO;
        _buttonFive.enabled = NO;
        _buttonSix.enabled = NO;
        _buttonSeven.enabled = NO;
        _buttonEight.enabled = NO;
        _buttonNine.enabled = NO;
        _buttonZero.enabled = NO;
        _buttonAdd.enabled = NO;
        _buttonDot.enabled = NO;
        _buttonPower.enabled = NO;
        _buttonBraO.enabled = NO;
        _buttonBraC.enabled = NO;
        _buttonBackspace.enabled = NO;
        _buttonClear.enabled = YES;
        _buttonAdd.enabled = NO;
        _buttonSubstract.enabled = NO;
        _buttonMultiply.enabled = NO;
        _buttonDivide.enabled = NO;
        _buttonEqual.enabled = NO;
        _STATE = 0;
    }
    
}




@end



#import <UIKit/UIKit.h>
#import "ENCalcController.h"

@interface ViewController : UIViewController

@property ENCalcController * controller;

@property UIButton * buttonEmpty;

@property int STATE;

@property int didDigit;
@property int didOp;
@property int didBraC;
@property int didBraO;
@property int countBraO;
@property int countNegate;
@property int countDot;


@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UIButton *buttonDot;
@property (weak, nonatomic) IBOutlet UIButton *buttonZero;
@property (weak, nonatomic) IBOutlet UIButton *buttonPower;
@property (weak, nonatomic) IBOutlet UIButton *buttonBraO;
@property (weak, nonatomic) IBOutlet UIButton *buttonBraC;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackspace;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubstract;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *buttonEqual;



- (IBAction)buttonOne:(id)sender;
- (IBAction)buttonTwo:(id)sender;
- (IBAction)buttonThree:(id)sender;
- (IBAction)buttonFour:(id)sender;
- (IBAction)buttonFive:(id)sender;
- (IBAction)buttonSix:(id)sender;
- (IBAction)buttonSeven:(id)sender;
- (IBAction)buttonEight:(id)sender;
- (IBAction)buttonNine:(id)sender;
- (IBAction)buttonZero:(id)sender;

- (IBAction)buttonDot:(id)sender;
- (IBAction)buttonCalc:(id)sender;
- (IBAction)buttonClear:(id)sender;
- (IBAction)buttonBackspace:(id)sender;

- (IBAction)buttonBraceOpen:(id)sender;
- (IBAction)buttonBraceClose:(id)sender;
- (IBAction)buttonPlus:(id)sender;
- (IBAction)buttonSubstract:(id)sender;
- (IBAction)buttonMultipy:(id)sender;
- (IBAction)buttonDivide:(id)sender;
- (IBAction)buttonPower:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *fieldText;


@end

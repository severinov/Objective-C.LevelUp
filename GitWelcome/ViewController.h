

#import <UIKit/UIKit.h>
#import "ENCalcController.h"

@interface ViewController : UIViewController

@property ENCalcController * controller;

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
- (IBAction)buttonEqual:(id)sender;
- (IBAction)buttonClear:(id)sender;

- (IBAction)buttonBraceOpen:(id)sender;
- (IBAction)buttonBraceClose:(id)sender;
- (IBAction)buttonPlus:(id)sender;
- (IBAction)buttonSubstract:(id)sender;
- (IBAction)buttonMultipy:(id)sender;
- (IBAction)buttonDivide:(id)sender;
- (IBAction)buttonPower:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *fieldText;


@end

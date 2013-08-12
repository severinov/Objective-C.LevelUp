#import <UIKit/UIKit.h>
#import "MaskView1.h"
#import "MaskView2.h"
#import "MaskView3.h"
#import "LabelView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet LabelView *label0;
@property (weak, nonatomic) IBOutlet LabelView *label1;
@property (weak, nonatomic) IBOutlet LabelView *label2;
@property (weak, nonatomic) IBOutlet LabelView *label3;
@property (weak, nonatomic) LabelView *labelView;
@property (assign, nonatomic) int numberMaskOfStack;
@property (strong, nonatomic) NSMutableArray *maskStack;

- (IBAction)button0:(id)sender;
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;
- (IBAction)button7:(id)sender;
- (IBAction)button8:(id)sender;
- (IBAction)button9:(id)sender;
- (IBAction)button10:(id)sender;
- (IBAction)button11:(id)sender;
- (IBAction)button12:(id)sender;
- (IBAction)button13:(id)sender;
- (IBAction)button14:(id)sender;

@end

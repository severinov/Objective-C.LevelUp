

#import <UIKit/UIKit.h>
#import "ENCalcController.h"

@interface ViewController : UIViewController

@property ENCalcController * controller;

- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *fieldExpression;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;


@end

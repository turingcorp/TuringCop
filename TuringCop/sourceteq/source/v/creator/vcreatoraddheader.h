#import "appdel.h"

@class vcreatoradd;

@interface vcreatoraddheader:UICollectionReusableView<UITextFieldDelegate>

@property(weak, nonatomic)vcreatoradd *creatoradd;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UIStepper *stepper;
@property(weak, nonatomic)UILabel *labelstepper;

@end
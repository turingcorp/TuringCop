#import "appdel.h"
#import "vcontactcell.h"

@interface vcontactwrite:vcontactcell<UITextFieldDelegate>

@property(weak, nonatomic)UITextField *fieldname;
@property(weak, nonatomic)UITextField *fieldemail;
@property(weak, nonatomic)UITextView *messageview;

@end
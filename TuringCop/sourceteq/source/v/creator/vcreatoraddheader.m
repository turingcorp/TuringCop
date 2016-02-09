#import "vcreatoraddheader.h"

@implementation vcreatoraddheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeSentences];
    [field setAutocorrectionType:UITextAutocorrectionTypeYes];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setDelegate:self];
    [field setFont:[UIFont fontWithName:fontname size:20]];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setPlaceholder:NSLocalizedString(@"creatoradd_header_title", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    self.field = field;
    
    UIStepper *stepper = [[UIStepper alloc] init];
    
    self.stepper = stepper;
    
    [self addSubview:field];
    [self addSubview:stepper];
    
    return self;
}

@end
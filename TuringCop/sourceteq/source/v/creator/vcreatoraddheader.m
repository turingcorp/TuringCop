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
    self.field = field;
    
    UIStepper *stepper = [[UIStepper alloc] init];
    
    self.stepper = stepper;
    
    [self addSubview:field];
    [self addSubview:stepper];
    
    return self;
}

@end
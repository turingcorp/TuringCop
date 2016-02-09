#import "vcreatoraddheader.h"

@implementation vcreatoraddheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UITextField *field = [[UITextField alloc] init];
    
    UIStepper *stepper = [[UIStepper alloc] init];
    
    [self addSubview:field];
    [self addSubview:stepper];
    
    return self;
}

@end
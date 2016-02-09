#import "vcreatoraddheader.h"

@implementation vcreatoraddheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *background = [[UIView alloc] init];
    [background setClipsToBounds:YES];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    
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
    [field setTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [field setTintColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.field = field;
    
    UIStepper *stepper = [[UIStepper alloc] init];
    [stepper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stepper setTintColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [stepper setMinimumValue:0];
    [stepper setMaximumValue:6];
    [stepper addTarget:self action:@selector(actionstepper:) forControlEvents:UIControlEventValueChanged];
    self.stepper = stepper;
    
    UILabel *labelstepper = [[UILabel alloc] init];
    [labelstepper setUserInteractionEnabled:NO];
    [labelstepper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelstepper setTextAlignment:NSTextAlignmentRight];
    [labelstepper setBackgroundColor:[UIColor clearColor]];
    [labelstepper setFont:[UIFont fontWithName:fontname size:20]];
    [labelstepper setTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    self.labelstepper = labelstepper;
    
    [self addSubview:border];
    [self addSubview:labelstepper];
    [self addSubview:background];
    [self addSubview:field];
    [self addSubview:stepper];
    
    NSDictionary *views = @{@"field":field, @"stepper":stepper, @"back":background, @"border":border, @"label":labelstepper};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-10-[stepper]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field(70)]-45-[stepper]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[field]-50-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[back(70)]" options:0 metrics:metrics views:views]];
    
    [self print];
    
    return self;
}

#pragma mark actions

-(void)actionstepper:(UIStepper*)stepper
{
    [self print];
}

#pragma mark functionality

-(void)print
{
    [self.labelstepper setText:[[tools singleton] numbertostring:@(self.stepper.value)]];
}

@end
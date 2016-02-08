#import "vcreatorheader.h"

@implementation vcreatorheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [button.layer setCornerRadius:4];
    [button setTitle:NSLocalizedString(@"creator_button_new", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:0 alpha:0.7] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:15]];
    [button addTarget:self action:@selector(actionbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[button(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(38)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionbutton:(UIButton*)button
{
    
}

@end
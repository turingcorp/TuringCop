#import "vturing.h"

@implementation vturing

-(instancetype)init:(cturing*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor whiteColor]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTitle:NSLocalizedString(@"turing_stoptest", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:16]];
    
    [self addSubview:border];
    [self addSubview:button];
    
    NSDictionary *views = @{@"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
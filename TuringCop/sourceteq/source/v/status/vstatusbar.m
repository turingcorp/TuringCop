#import "vstatusbar.h"

@implementation vstatusbar

-(instancetype)init:(cstatus*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIView *border = [[UIView alloc] init];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:NSLocalizedString(@"status_taketest", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:15]];
    [button setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitleColor:[UIColor colorWithWhite:0 alpha:1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    
    [self addSubview:border];
    [self addSubview:button];
    
    NSDictionary *views = @{@"border":border, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(50)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actiontest:(UIButton*)button
{
    [(cstatus*)self.controller taketest];
}

@end
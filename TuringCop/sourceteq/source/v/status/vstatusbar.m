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
    [button addTarget:self action:@selector(actiontest:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *creator = [[UIButton alloc] init];
    [creator setTitle:NSLocalizedString(@"status_creator", nil) forState:UIControlStateNormal];
    [creator.titleLabel setFont:[UIFont fontWithName:fontname size:15]];
    [creator setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [creator setClipsToBounds:YES];
    [creator setTranslatesAutoresizingMaskIntoConstraints:NO];
    [creator setTitleColor:[UIColor colorWithWhite:0 alpha:1] forState:UIControlStateNormal];
    [creator setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [creator addTarget:self action:@selector(actioncreator:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:border];
    [self addSubview:button];
    [self addSubview:creator];
    
    NSDictionary *views = @{@"border":border, @"button":button, @"creator":creator};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[creator(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[creator(40)]-20-[button]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actiontest:(UIButton*)button
{
    [(cstatus*)self.controller taketest];
}

-(void)actioncreator:(UIButton*)button
{
    [(cstatus*)self.controller creator];
}

@end
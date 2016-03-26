#import "vtoast.h"

static NSUInteger const basewidth = 280;
static NSUInteger const baseheight = 250;
static NSUInteger const buttonheight = 50;

@interface vtoast ()

@property(weak, nonatomic)ctoast *controller;

@end

@implementation vtoast

@dynamic controller;

-(instancetype)init:(ctoast*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur dark];
    [blur setAlpha:0.9];
    
    UIView *base = [[UIView alloc] init];
    [base setBackgroundColor:[UIColor whiteColor]];
    [base setClipsToBounds:YES];
    [base setTranslatesAutoresizingMaskIntoConstraints:NO];
    [base.layer setCornerRadius:5];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setFont:[UIFont fontWithName:fontregularname size:22]];
    [label setTextColor:colorsecond];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:controller.message];
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colormain];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitle:NSLocalizedString(@"toast_continue", nil) forState:UIControlStateNormal];
    [button setTitleColor:colorsecond forState:UIControlStateNormal];
    [button setTitleColor:[colorsecond colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:18]];
    [button addTarget:self action:@selector(actiondismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    [base addSubview:label];
    [base addSubview:button];
    [self addSubview:blur];
    [self addSubview:base];
    
    NSDictionary *views = @{@"blur":blur, @"base":base, @"label":label, @"button":button};
    NSDictionary *metrics = @{@"basewidth":@(basewidth), @"baseheight":@(baseheight), @"buttonheight":@(buttonheight)};
    
    self.layoutbaseleft = [NSLayoutConstraint constraintWithItem:base attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.layoutbasetop = [NSLayoutConstraint constraintWithItem:base attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[base(basewidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[base(baseheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-[button(buttonheight)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbaseleft];
    [self addConstraint:self.layoutbasetop];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat extrawidth = width - basewidth;
    CGFloat extraheight = height - baseheight;
    CGFloat marginleft = extrawidth / 2.0;
    CGFloat margintop = extraheight / 2.0;
    
    self.layoutbaseleft.constant = marginleft;
    self.layoutbasetop.constant = margintop;
    
    [super layoutSubviews];
}

#pragma mark actions

-(void)actiondismiss:(UIButton*)button
{
    [button setUserInteractionEnabled:NO];
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [self.controller dismiss];
     }];
}

@end
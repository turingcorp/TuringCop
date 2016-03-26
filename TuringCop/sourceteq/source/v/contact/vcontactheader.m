#import "vcontactheader.h"

static NSUInteger const rocketheight = 80;
static NSUInteger const fireminheight = 10;

@implementation vcontactheader

-(instancetype)init:(ccontact*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorsecond];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    self.fireinitialheight = fireminheight;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback.imageView setTintColor:[UIColor blackColor]];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:fontregularname size:18]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:NSLocalizedString(@"contact_title", nil)];
    
    UIImageView *imagerocket = [[UIImageView alloc] init];
    [imagerocket setUserInteractionEnabled:NO];
    [imagerocket setClipsToBounds:YES];
    [imagerocket setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagerocket setTintColor:[UIColor blackColor]];
    [imagerocket setImage:[[UIImage imageNamed:@"rocket"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagerocket setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *imagefire = [[UIImageView alloc] init];
    [imagefire setUserInteractionEnabled:NO];
    [imagefire setClipsToBounds:YES];
    [imagefire setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagefire setTintColor:[UIColor blackColor]];
    [imagefire setImage:[[UIImage imageNamed:@"fire"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagefire setContentMode:UIViewContentModeScaleAspectFit];
    [imagefire setAlpha:0];
    self.imagefire = imagefire;
    
    [self addSubview:label];
    [self addSubview:imagefire];
    [self addSubview:imagerocket];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label, @"imagerocket":imagerocket, @"imagefire":imagefire};
    NSDictionary *metrics = @{@"rocketheight":@(rocketheight)};
    
    self.layoutfireheight = [NSLayoutConstraint constraintWithItem:imagefire attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:fireminheight];
    self.layoutrocketbottom = [NSLayoutConstraint constraintWithItem:imagerocket attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-((CGFloat)fireminheight)];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonback(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imagefire]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imagerocket(rocketheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imagerocket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imagefire]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutfireheight];
    [self addConstraint:self.layoutrocketbottom];
    
    return self;
}

#pragma amrk actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end
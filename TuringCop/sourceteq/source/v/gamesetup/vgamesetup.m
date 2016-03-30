#import "vgamesetup.h"

static NSUInteger const buttonbackheight = 60;

@interface vgamesetup ()

@property(weak, nonatomic)cgamesetup *controller;

@end

@implementation vgamesetup

@dynamic controller;

-(instancetype)init:(cgamesetup*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    [spinner setAlpha:0.5];
    self.spinner = spinner;
    
    UILabel *loadingtitle = [[UILabel alloc] init];
    [loadingtitle setBackgroundColor:[UIColor clearColor]];
    [loadingtitle setUserInteractionEnabled:NO];
    [loadingtitle setTextAlignment:NSTextAlignmentCenter];
    [loadingtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [loadingtitle setTextColor:[UIColor main]];
    [loadingtitle setFont:[UIFont regularsize:16]];
    [loadingtitle setText:NSLocalizedString(@"game_setup_loading_title", nil)];
    self.loadingtitle = loadingtitle;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setTintColor:[UIColor second]];
    [buttonback.imageView setContentMode:UIViewContentModeCenter];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonback setTitle:NSLocalizedString(@"game_setup_cancel_button", nil) forState:UIControlStateNormal];
    [buttonback setTitleColor:[UIColor second] forState:UIControlStateNormal];
    [buttonback setTitleColor:[[UIColor second] colorWithAlphaComponent:0.4] forState:UIControlStateHighlighted];
    [buttonback.titleLabel setFont:[UIFont boldsize:16]];
    
    [self addSubview:loadingtitle];
    [self addSubview:spinner];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"spinner":spinner, @"loadingtitle":loadingtitle, @"buttonback":buttonback};
    NSDictionary *metrics = @{@"buttonbackheight":@(buttonbackheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[spinner(50)]-10-[loadingtitle]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingtitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonback(buttonbackheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionback:(UIButton*)button
{
    [self.controller cancelgame];
}

#pragma mark public

-(void)locationready
{
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
    [self.loadingtitle removeFromSuperview];
    
    vgamesetuplocation *location = [[vgamesetuplocation alloc] init:self.controller];
    [self addSubview:location];
    
    NSDictionary *views = @{@"location":location};
    NSDictionary *metrics = @{@"buttonbackheight":@(buttonbackheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[location]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[location]-(buttonbackheight)-|" options:0 metrics:metrics views:views]];
}

@end
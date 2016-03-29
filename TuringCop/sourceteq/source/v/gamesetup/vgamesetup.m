#import "vgamesetup.h"

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
    
    [self addSubview:loadingtitle];
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner, @"loadingtitle":loadingtitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[spinner(50)]-10-[loadingtitle]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingtitle]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)locationready
{
    
}

@end
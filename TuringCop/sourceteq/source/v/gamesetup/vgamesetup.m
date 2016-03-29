#import "vgamesetup.h"

static NSString* const gamesetupcell = @"cellid";
static NSString* const gamesetupfooter = @"footerid";
static NSUInteger const footerheight = 150;

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
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)locationready
{
    
}

@end
#import "vgameloader.h"

static NSUInteger const spinnerheight = 50;

@interface vgameloader ()

@property(weak, nonatomic)cgameloader *controller;

@end

@implementation vgameloader

@dynamic controller;

-(instancetype)init:(cgameloader*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel
 
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.spinner stopAnimating];
}

@end
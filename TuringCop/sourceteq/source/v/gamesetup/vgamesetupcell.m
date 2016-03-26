#import "vgamesetupcell.h"

@implementation vgamesetupcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark public

-(void)config:(UIView*)overview
{
    [self.overview removeFromSuperview];
    [self addSubview:overview];
    self.overview = overview;
    
    NSDictionary *views = @{@"overview":overview};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[overview]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[overview]-0-|" options:0 metrics:metrics views:views]];
}

@end
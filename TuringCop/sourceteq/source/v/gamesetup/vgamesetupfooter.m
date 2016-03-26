#import "vgamesetupfooter.h"

@implementation vgamesetupfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    [spinner startAnimating];
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
#import "vstatusbar.h"

@implementation vstatusbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *border = [[UIView alloc] init];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:colormain];
    
    [self addSubview:border];
    
    NSDictionary *views = @{@"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
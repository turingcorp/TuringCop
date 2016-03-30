#import "vgamesetuplocation.h"

@implementation vgamesetuplocation

-(instancetype)init:(cgamesetup*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    vgamesetuplocationgradient *gradient = [[vgamesetuplocationgradient alloc] init];
    
    UIImageView *map = [[UIImageView alloc] init];
    [map setUserInteractionEnabled:NO];
    [map setTranslatesAutoresizingMaskIntoConstraints:NO];
    [map setImage:controller.model.image];
    [map setContentMode:UIViewContentModeScaleAspectFill];
    [map setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor main]];
    [label setFont:[UIFont regularsize:18]];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:[NSString stringWithFormat:NSLocalizedString(@"game_setup_mission_title", nil), controller.model.venue.name]];
    
    [self addSubview:map];
    [self addSubview:gradient];
    [self addSubview:label];
    
    NSDictionary *views = @{@"map":map, @"label":label, @"gradient":gradient};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[gradient]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[map]-0-[label(50)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[gradient(50)]-0-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
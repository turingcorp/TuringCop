#import "vgamesetuplocation.h"

@implementation vgamesetuplocation

-(instancetype)init:(cgamesetup*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    NSDictionary *dicttitle = @{NSForegroundColorAttributeName:[UIColor second], NSFontAttributeName:[UIFont boldsize:15]};
    NSDictionary *dictlocation = @{NSForegroundColorAttributeName:[UIColor main], NSFontAttributeName:[UIFont regularsize:18]};
    NSString *stringtitle = NSLocalizedString(@"game_setup_mission_title", nil);
    NSString *stringlocation = controller.model.venue.name;
    
    if(!stringlocation)
    {
        stringlocation = NSLocalizedString(@"game_setup_mission_unknown", nil);
    }
    
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
    NSAttributedString *attrlocation = [[NSAttributedString alloc] initWithString:stringlocation attributes:dictlocation];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrlocation];
    
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
    [label setAttributedText:mut];
    
    [self addSubview:map];
    [self addSubview:gradient];
    [self addSubview:label];
    
    NSDictionary *views = @{@"map":map, @"label":label, @"gradient":gradient};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[gradient]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[label]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[map]-0-[label(60)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[gradient(50)]-0-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
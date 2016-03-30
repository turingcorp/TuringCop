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
    
    UIButton *buttonstart = [[UIButton alloc] init];
    [buttonstart setClipsToBounds:YES];
    [buttonstart setBackgroundColor:[UIColor main]];
    [buttonstart setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonstart setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonstart setTitle:NSLocalizedString(@"game_setup_mission_start", nil) forState:UIControlStateNormal];
    [buttonstart.layer setCornerRadius:4];
    [buttonstart.titleLabel setFont:[UIFont boldsize:16]];
    [buttonstart addTarget:self action:@selector(actionstart:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:map];
    [self addSubview:gradient];
    [self addSubview:label];
    [self addSubview:buttonstart];
    
    NSDictionary *views = @{@"map":map, @"label":label, @"gradient":gradient, @"buttonstart":buttonstart};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[gradient]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[label]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonstart(100)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[map]-0-[label(60)]-10-[buttonstart(34)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[gradient(50)]-0-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionstart:(UIButton*)button
{
    [self.controller startgame];
}

@end
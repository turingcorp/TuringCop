#import "vgamesetuplocation.h"

@implementation vgamesetuplocation

-(instancetype)init:(cgamesetup*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

@end
#import "vgameloader.h"

@interface vgameloader ()

@property(weak, nonatomic)cgameloader *controller;

@end

@implementation vgameloader

-(instancetype)init:(cgameloader*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

@end
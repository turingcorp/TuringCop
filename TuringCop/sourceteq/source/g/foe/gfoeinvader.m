#import "gfoeinvader.h"

@implementation gfoeinvader

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init];
    self.model = model;
    self.x = 50;
    self.y = 50;
    self.width = 100;
    self.height = 100;
    [self.image loadtextures:@[@"foe_invader0", @"foe_invader1"]];
    self.image.random = YES;
    self.image.srgb = YES;
    [self render];
    
    return self;
}

@end
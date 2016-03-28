#import "gfoeinvader.h"

@implementation gfoeinvader

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init];
    self.model = model;
    self.x = 50;
    self.y = 50;
    self.width = 50;
    self.height = 50;
    [self.image loadtextures:@[@"foe_invader0", @"foe_invader1", @"foe_invader2", @"foe_invader3", @"foe_invader4", @"foe_invader5", @"foe_invader6"]];
    self.image.random = NO;
    self.image.srgb = YES;
    [self render];
    
    return self;
}

@end
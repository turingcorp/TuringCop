#import "gfoeinvader.h"

@implementation gfoeinvader

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init];
    self.model = model;
    self.x = 1000;
    self.y = 100;
    self.width = 2000;
    self.height = 2000;
    [self.image loadtextures:@[@"foe_invader0"]];
    [self render];
    
    return self;
}

@end
#import "gfoeinvader.h"

@implementation gfoeinvader

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init];
    self.model = model;
    self.x = 0;
    self.y = 0;
    self.width = 100;
    self.height = 100;
    [self.image loadtextures:@[@"foe_invader0"]];
    [self render];
    
    return self;
}

@end
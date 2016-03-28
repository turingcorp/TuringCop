#import "gfoeinvader.h"

@implementation gfoeinvader

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init];
    self.model = model;
    self.x = 0;
    self.y = 0;
    self.width = 84;
    self.height = 84;
    self.color = GLKVector4Make(1, 0, 0, 1);
    [self.image loadtextures:@[@"foe_invader0"]];
    [self render];
    
    return self;
}

@end
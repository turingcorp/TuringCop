#import "gfoeiteminvader.h"

@interface gfoeiteminvader ()

@property(weak, nonatomic)mfoeiteminvader *model;

@end

@implementation gfoeiteminvader

@dynamic model;

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init:model];
    self.x = 100;
    self.y = self.realy = 100;
    self.width = 50;
    self.height = 50;
    [self.image loadtextures:@[@"foe_invader0", @"foe_invader1", @"foe_invader2"]];
    
    return self;
}

@end
#import "gfoeitemocto.h"

@interface gfoeitemocto ()

@property(weak, nonatomic)mfoeitemocto *model;

@end

@implementation gfoeitemocto

@dynamic model;

-(instancetype)init:(mfoeitemocto*)model
{
    self = [super init:model];
    self.x = 200;
    self.y = self.visualy = 200;
    self.width = 50;
    self.height = 50;
    [self.image loadtextures:@[@"foe_octo0", @"foe_octo1", @"foe_octo2"]];
    
    return self;
}

@end
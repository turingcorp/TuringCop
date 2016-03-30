#import "gbuildingitem.h"

@implementation gbuildingitem

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    
    self.x = 160;
    self.y = 50;
    self.width = 70;
    self.height = 160;
    self.color = GLKVector4Make(1, 1, 1, 0.5);
    self.image.srgb = YES;
    [self.image loadtextures:@[@"building1"]];
    return self;
}

@end
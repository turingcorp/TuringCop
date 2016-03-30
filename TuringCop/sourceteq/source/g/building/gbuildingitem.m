#import "gbuildingitem.h"

@implementation gbuildingitem

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    
    self.x = model.x;
    self.y = model.y;
    self.width = model.width;
    self.height = model.height;
    self.color = GLKVector4Make(1, 1, 1, 0);
    self.image.srgb = YES;
    [self.image loadtextures:@[model.assetname]];
    return self;
}

@end
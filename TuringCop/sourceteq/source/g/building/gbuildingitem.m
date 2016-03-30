#import "gbuildingitem.h"

@implementation gbuildingitem

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    
    self.x = 160;
    self.y = 50;
    self.width = 90;
    self.height = 160;
    [self.image loadtextures:@[@"building0"]];
    return self;
}

@end
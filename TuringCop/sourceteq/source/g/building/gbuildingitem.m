#import "gbuildingitem.h"

@implementation gbuildingitem

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    
    self.x = 500;
    self.y = 500;
    self.width = 100;
    self.height = 200;
    [self.image loadtextures:@[@"building0"]];
    return self;
}

@end
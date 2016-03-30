#import "appdel.h"
#import "gspatial.h"

@class mbuildingitem;

@interface gbuildingitem:gspatial

-(instancetype)init:(mbuildingitem*)model;

@property(weak, nonatomic)mbuildingitem *model;

@end
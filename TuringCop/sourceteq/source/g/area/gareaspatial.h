#import "appdel.h"
#import "gspatial.h"

@class mgamearea;

@interface gareaspatial:gspatial

-(instancetype)init:(mgamearea*)model;

@property(weak, nonatomic)mgamearea *model;

@end
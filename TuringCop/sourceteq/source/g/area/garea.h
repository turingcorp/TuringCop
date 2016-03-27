#import "appdel.h"
#import "gbase.h"

@class gareaspatial;
@class mgamearea;

@interface garea:gbase

-(instancetype)init:(mgamearea*)model;

@property(weak, nonatomic)mgamearea *model;
@property(strong, nonatomic)gareaspatial *spatial;

@end
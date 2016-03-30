#import "appdel.h"
#import "gbase.h"

@class mbuilding;

@interface gbuilding:gbase

-(instancetype)init:(mbuilding*)model;

@property(weak, nonatomic)mbuilding *model;

@end
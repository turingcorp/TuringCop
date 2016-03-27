#import "appdel.h"
#import "gbase.h"

@class mfoe;
@class gspatial;

@interface gfoe:gbase

-(instancetype)init:(mfoe*)model;

@property(weak, nonatomic)mfoe *model;

@end
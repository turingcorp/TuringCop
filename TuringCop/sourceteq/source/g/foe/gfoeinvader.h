#import "appdel.h"
#import "gspatial.h"

@class mfoeiteminvader;

@interface gfoeinvader:gspatial

-(instancetype)init:(mfoeiteminvader*)model;

@property(weak, nonatomic)mfoeiteminvader *model;

@end
#import "appdel.h"
#import "gspatial.h"

@class gfoeitem;

@interface gfoeshadow:gspatial

-(instancetype)init:(gfoeitem*)foe;

@property(weak, nonatomic)gfoeitem *foe;

@end
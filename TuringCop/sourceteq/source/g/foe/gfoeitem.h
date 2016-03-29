#import <Foundation/Foundation.h>
#import "gspatial.h"

@class mfoeitem;
@class gfoeshadow;

@interface gfoeitem:gspatial

-(instancetype)init:(mfoeitem*)model;

@property(weak, nonatomic)mfoeitem *model;
@property(strong, nonatomic)gfoeshadow *shadow;

@end
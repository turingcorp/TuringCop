#import "appdel.h"

@class gbuilding;
@class mbuildingitem;

@interface mbuilding:NSObject

@property(strong, nonatomic)gbuilding *glkbuilding;
@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;

@end
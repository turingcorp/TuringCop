#import "appdel.h"

@class gbuilding;
@class mbuildingitem;

@interface mbuilding:NSObject

-(void)addbuildingatx:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gbuilding *glkbuilding;
@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;
@property(strong, nonatomic)NSArray *rawbuldings;

@end
#import "appdel.h"
#import "mcreatoraddtypeprotocol.h"

@class mcreatoraddtitle;
@class mcreatoradditem;

@interface mcreatoradd:NSObject

-(NSUInteger)count;
-(mcreatoradditem*)item:(NSUInteger)index;
-(void)add:(mcreatoradditem*)item;

@property(strong, nonatomic)mcreatoraddtitle *title;
@property(strong, nonatomic)id<mcreatoraddtypeprotocol> type;
@property(strong, nonatomic)NSMutableArray *array;

@end
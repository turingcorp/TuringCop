#import "appdel.h"
#import "mcreatoraddtypeprotocol.h"

@class mcreatoraddtitle;
@class mcreatoradditem;

@interface mcreatoradd:NSObject

-(void)changetype:(id<mcreatoraddtypeprotocol>)type;
-(NSUInteger)count;
-(mcreatoradditem*)item:(NSUInteger)index;
-(void)add:(mcreatoradditem*)item;
-(void)additem;
-(void)remove:(NSUInteger)index;

@property(strong, nonatomic)mcreatoraddtitle *title;
@property(strong, nonatomic)id<mcreatoraddtypeprotocol> type;
@property(strong, nonatomic)NSMutableArray *array;

@end
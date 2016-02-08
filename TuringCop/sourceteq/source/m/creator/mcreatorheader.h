#import "appdel.h"
#import "mcreatorheaderprotocol.h"

@interface mcreatorheader:NSObject

-(NSUInteger)count;
-(id<mcreatorheaderprotocol>)item:(NSUInteger)index;

@end
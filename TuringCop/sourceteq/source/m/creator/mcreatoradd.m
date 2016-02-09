#import "mcreatoradd.h"

@implementation mcreatoradd

-(instancetype)init
{
    self = [super init];
    
    self.title = [[mcreatoraddtitle alloc] init];
    self.array = [NSMutableArray array];
    
    return self;
}

@end
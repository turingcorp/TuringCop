#import "mcreatoradd.h"

@implementation mcreatoradd

-(instancetype)init
{
    self = [super init];
    
    self.title = [[mcreatoraddtitle alloc] init];
    self.array = [NSMutableArray array];
    self.type = [[mcreatoraddtypetext alloc] init];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = self.array.count;
    
    return count;
}

-(mcreatoradditem*)item:(NSUInteger)index
{
    mcreatoradditem *item = self.array[index];
    
    return item;
}

-(void)add:(mcreatoradditem*)item
{
    [self.array addObject:item];
}

@end
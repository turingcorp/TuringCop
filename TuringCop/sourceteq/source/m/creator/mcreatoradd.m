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

-(void)changetype:(id<mcreatoraddtypeprotocol>)type
{
    self.type = type;
    
    NSUInteger previous = [self count];
    self.array = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < previous; i++)
    {
        [self additem];
    }
}

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

-(void)additem
{
    [self add:[self.type itemtype]];
}

-(void)remove:(NSUInteger)index
{
    [self.array removeObjectAtIndex:index];
}

@end
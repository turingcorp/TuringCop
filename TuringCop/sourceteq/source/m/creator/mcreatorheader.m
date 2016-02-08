#import "mcreatorheader.h"

@implementation mcreatorheader
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mcreatorheaderadd alloc] init],
             [[mcreatorheaderexport alloc] init],
             [[mcreatorheaderclose alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mcreatorheaderprotocol>)item:(NSUInteger)index;
{
    id<mcreatorheaderprotocol> item = array[index];
    
    return item;
}

@end
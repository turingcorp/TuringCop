#import "mbuilding.h"

@implementation mbuilding

-(instancetype)init
{
    self = [super init];
    self.glkbuilding = [[gbuilding alloc] init:self];
    self.items = [NSMutableArray array];
    [self.items addObject:[[mbuildingitem alloc] init]];
    [self.items addObject:[[mbuildingitem alloc] init]];
    
    return self;
}

@end
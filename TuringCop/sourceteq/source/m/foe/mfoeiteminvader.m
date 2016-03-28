#import "mfoeiteminvader.h"

@implementation mfoeiteminvader

-(instancetype)init
{
    self = [super init];
    self.spatial = [[gfoeinvader alloc] init:self];
    
    return self;
}

@end
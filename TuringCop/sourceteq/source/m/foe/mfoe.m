#import "mfoe.h"

@implementation mfoe

-(instancetype)init
{
    self = [super init];
    self.glkfoe = [[gfoe alloc] init:self];
    self.items = [NSMutableArray array];
    [self.items addObject:[[mfoeiteminvader alloc] init]];
    [self.items addObject:[[mfoeitemocto alloc] init]];
    
    return self;
}

@end
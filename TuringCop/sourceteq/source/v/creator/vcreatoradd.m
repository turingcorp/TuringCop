#import "vcreatoradd.h"

@implementation vcreatoradd

-(instancetype)init:(ccreatoradd*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    self.model = [[mcreatoradd alloc] init];
    
    return self;
}

@end
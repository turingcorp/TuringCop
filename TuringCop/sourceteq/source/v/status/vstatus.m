#import "vstatus.h"

@implementation vstatus

-(instancetype)init:(cstatus*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor redColor]];
    
    return self;
}

@end
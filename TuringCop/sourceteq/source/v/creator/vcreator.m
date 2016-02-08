#import "vcreator.h"

@implementation vcreator

-(instancetype)init:(ccreator*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    
    
    return self;
}

@end
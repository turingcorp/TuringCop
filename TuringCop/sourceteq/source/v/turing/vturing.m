#import "vturing.h"

@implementation vturing

-(instancetype)init:(cturing*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blueColor]];
    
    return self;
}

@end
#import "vturingbar.h"

@implementation vturingbar

-(instancetype)init:(cturing*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end

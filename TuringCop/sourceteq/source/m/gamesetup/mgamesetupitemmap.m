#import "mgamesetupitemmap.h"

static NSUInteger const mapcellheight = 200;

@implementation mgamesetupitemmap

-(instancetype)init
{
    self = [super init];
    self.cellheight = mapcellheight;
    
    return self;
}

@end
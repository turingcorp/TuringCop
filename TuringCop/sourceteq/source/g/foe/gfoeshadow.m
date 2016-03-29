#import "gfoeshadow.h"

@implementation gfoeshadow

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"foe_shadow"]];
    
    return self;
}

@end
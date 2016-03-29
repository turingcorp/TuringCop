#import "gfoeshadow.h"

@implementation gfoeshadow

-(instancetype)init
{
    self = [super init];
    self.height = 20;
    [self.image loadtextures:@[@"foe_shadow"]];
    
    return self;
}

@end
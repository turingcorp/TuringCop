#import "gfoeshadow.h"

@implementation gfoeshadow

-(instancetype)init
{
    self = [super init];
    self.height = 30;
    [self.image loadtextures:@[@"foe_shadow"]];
    
    return self;
}

@end
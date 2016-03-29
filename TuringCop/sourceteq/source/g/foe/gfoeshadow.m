#import "gfoeshadow.h"

@implementation gfoeshadow

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"foe_shadow"]];
    
    return self;
}

-(void)screenmovedx:(CGFloat)x y:(CGFloat)y
{
}

@end
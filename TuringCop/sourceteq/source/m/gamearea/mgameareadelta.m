#import "mgameareadelta.h"

@implementation mgameareadelta

-(instancetype)init:(CGFloat)x y:(CGFloat)y
{
    self = [super initWithDictionary:@{@"x":@(x), @"y":@(y)}];
    
    return self;
}

-(CGFloat)deltax
{
    return [self[@"x"] doubleValue];
}

-(CGFloat)deltay
{
    return [self[@"y"] doubleValue];
}

@end
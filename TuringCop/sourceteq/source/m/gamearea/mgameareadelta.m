#import "mgameareadelta.h"

static NSString* const xkey = @"x";
static NSString* const ykey = @"y";

@implementation mgameareadelta

-(instancetype)init:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.deltax = x;
    self.deltay = y;
    
    return self;
}

@end
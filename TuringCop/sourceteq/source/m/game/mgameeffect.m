#import "mgameeffect.h"

static NSString* const effectkey = @"effect";

@implementation mgameeffect

-(instancetype)init:(GLKBaseEffect*)effect
{
    self = [super initWithDictionary:@{effectkey:effect}];
    
    return self;
}

-(GLKBaseEffect*)effect
{
    return self[effectkey];
}

@end
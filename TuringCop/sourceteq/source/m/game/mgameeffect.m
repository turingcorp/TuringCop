#import "mgameeffect.h"

static NSString* const effectkey = @"effect";

@implementation mgameeffect

-(instancetype)init:(GLKBaseEffect*)effect
{
    self = [super init];
    self.effect = effect;
    
    return self;
}

@end
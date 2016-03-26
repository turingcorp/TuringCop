#import "mgamesetup.h"

@implementation mgamesetup

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mgamesetupitemmap alloc] init]
                   ];
    
    return self;
}

@end
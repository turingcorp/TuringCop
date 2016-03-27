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

#pragma mark public

-(mgamearea*)modelarea
{
    mgamearea *modelarea;
    
    for(mgamesetupitem *item in self.items)
    {
        if([item isKindOfClass:[mgamesetupitemmap class]])
        {
            modelarea = [(mgamesetupitemmap*)item modelarea];
            
            break;
        }
    }
    
    return modelarea;
}

@end
#import "gfoe.h"

@implementation gfoe

-(instancetype)init:(mfoe*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

#pragma mark -
#pragma mark gbase

-(void)draw:(GLKBaseEffect*)effect
{
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.useConstantColor = NO;
    
    for(mfoeitem *item in self.model.items)
    {
        [item.spatial draw:effect];
    }
}

@end
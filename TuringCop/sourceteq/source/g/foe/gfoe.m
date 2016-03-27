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
//    [self.spatial draw:effect];
}

@end
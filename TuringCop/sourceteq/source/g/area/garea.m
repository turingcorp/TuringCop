#import "garea.h"

@implementation garea

-(instancetype)init:(mgamearea*)model
{
    self = [super init];
    self.spatial = [[gareaspatial alloc] init:model];
    
    return self;
}

#pragma mark -
#pragma mark gbase

-(void)draw:(GLKBaseEffect*)effect
{
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    [self.spatial draw:effect];
}

@end
#import "mgame.h"

@implementation mgame

-(instancetype)init:(mgamearea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    
    [self loadall];
    
    return self;
}

#pragma mark functionality

-(void)loadall
{
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.context];
    [self.modelarea loadarea];
}

@end
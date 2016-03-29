#import "vgame.h"

@implementation vgame

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setContext:[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [self setDelegate:self];
    self.controller = controller;
    [EAGLContext setCurrentContext:self.context];
    [self starteffect];
    
    return self;
}

#pragma mark functionality

-(void)starteffect
{
    self.effect = [[GLKBaseEffect alloc] init];
//    self.effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, screenwidth, screenheight, 0, 1, -1);
    self.effect.texture2d0.target = GLKTextureTarget2D;
    [self.effect prepareToDraw];
}

-(void)notifydraw
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkdraw object:nil userInfo:@{userinfoeffect:self.effect}];
}

#pragma mark -
#pragma mark glkview del

-(void)glkView:(GLKView*)view drawInRect:(CGRect)rect
{
    glDisable(GL_DEPTH_TEST);
    glClearColor(0,0,0,0);
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    
    [self notifydraw];
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    glDisable(GL_BLEND);
}

@end
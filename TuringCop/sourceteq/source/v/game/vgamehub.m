#import "vgamehub.h"

@implementation vgamehub

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    self.modelarea = controller.model.modelarea;
    self.moved = YES;
 
    UIPanGestureRecognizer *pangesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panrecognized:)];
    self.pangesture = pangesture;
    [self addGestureRecognizer:pangesture];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkdraw:(NSNotification*)notification
{
    if(self.moved)
    {
        self.moved = NO;
        
        CGFloat left = self.modelarea.x;
        CGFloat top = self.modelarea.y;
        CGFloat right = self.modelarea.x + self.modelarea.width;
        CGFloat bottom = self.modelarea.y + self.modelarea.height;
        
        GLKBaseEffect *effect = notification.userInfo[userinfoeffect];
        effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
        
        [self.modelarea.glkarea.spatial render];
    }
}

#pragma mark gestures

-(void)panrecognized:(UIPanGestureRecognizer*)pangesture
{
    switch(pangesture.state)
    {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStatePossible:
            
            break;
            
        case UIGestureRecognizerStateChanged:
    
            [self movearea];
            
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            
            break;
    }
}

#pragma mark functionality

-(void)movearea
{
    CGPoint pointmove = [self.pangesture translationInView:self];
    CGFloat newx = self.modelarea.x + pointmove.x;
    CGFloat newy = self.modelarea.y + pointmove.y;
    
    if(newx < self.modelarea.minx)
    {
        newx = self.modelarea.minx;
    }
    else if(newx > self.modelarea.maxx)
    {
        newx = self.modelarea.maxx;
    }
    
    if(newy < self.modelarea.miny)
    {
        newy = self.modelarea.miny;
    }
    else if(newy > self.modelarea.maxy)
    {
        newy = self.modelarea.maxy;
    }
    
    NSLog(@"%@ %@", @(newx), @(newy));
    
    self.modelarea.x = newx;
    self.modelarea.y = newy;
    self.moved = YES;
}

@end
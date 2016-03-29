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
 
    UIPanGestureRecognizer *pangesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panrecognized:)];
    self.pangesture = pangesture;
    [self addGestureRecognizer:pangesture];
    
    return self;
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
    
    CGFloat deltax = self.modelarea.x - newx;
    CGFloat deltay = self.modelarea.y - newy;
    mgameareadelta *areadelta = [[mgameareadelta alloc] init:deltax y:deltay];
    self.modelarea.x = newx;
    self.modelarea.y = newy;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkscreenmoved object:nil userInfo:areadelta];
}

@end
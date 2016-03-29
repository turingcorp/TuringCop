#import "appdel.h"

@class cgame;
@class mgamearea;

@interface vgamehub:UIView

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;
@property(weak, nonatomic)UIPanGestureRecognizer *pangesture;
@property(weak, nonatomic)mgamearea *modelarea;
@property(nonatomic)BOOL moved;

@end
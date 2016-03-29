#import "appdel.h"

@class cgame;
@class vgamehub;

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;
@property(weak, nonatomic)vgamehub *hub;
@property(strong, nonatomic)GLKBaseEffect *effect;

@end
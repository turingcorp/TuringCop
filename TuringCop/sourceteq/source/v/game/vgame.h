#import "appdel.h"

@class cgame;
@class vgamehub;

static NSString* const userinfoeffect = @"effect";

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;
@property(weak, nonatomic)vgamehub *hub;
@property(strong, nonatomic)GLKBaseEffect *effect;

@end
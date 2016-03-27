#import "appdel.h"

@class cgame;

static NSString* const userinfoeffect = @"effect";

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;
@property(strong, nonatomic)GLKBaseEffect *effect;

@end
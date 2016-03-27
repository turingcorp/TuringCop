#import "appdel.h"

@class cgame;
@class garea;

static NSString* const userinfoeffect = @"effect";

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(cgame*)controller;

@property(strong, nonatomic)garea *glkarea;
@property(weak, nonatomic)cgame *controller;
@property(strong, nonatomic)GLKBaseEffect *effect;

@end
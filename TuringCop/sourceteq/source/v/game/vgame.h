#import "appdel.h"

static NSString* const userinfoeffect = @"effect";

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(GLKViewController*)controller;

@property(weak, nonatomic)GLKViewController *controller;
@property(strong, nonatomic)GLKBaseEffect *effect;

@end
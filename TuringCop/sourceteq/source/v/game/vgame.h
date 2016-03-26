#import "appdel.h"

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(GLKViewController*)controller;

@property(weak, nonatomic)GLKViewController *controller;

@end
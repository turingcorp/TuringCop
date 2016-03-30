#import "appdel.h"

@class cgamesetup;

@interface vgamesetuplocation:UIView

-(instancetype)init:(cgamesetup*)controller;

@property(weak, nonatomic)cgamesetup *controller;

@end
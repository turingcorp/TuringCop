#import "appdel.h"
#import "viewbase.h"

@class vspinner;

@interface vgamesetup:viewbase

-(void)locationready;

@property(weak, nonatomic)vspinner *spinner;

@end
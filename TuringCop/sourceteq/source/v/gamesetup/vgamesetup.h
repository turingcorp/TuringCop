#import "appdel.h"
#import "viewbase.h"

@class vspinner;

@interface vgamesetup:viewbase

-(void)locationready;

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UILabel *loadingtitle;

@end
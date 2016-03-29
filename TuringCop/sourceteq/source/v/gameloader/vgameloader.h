#import "appdel.h"
#import "viewbase.h"

@class vspinner;

@interface vgameloader:viewbase

-(void)loadfinished;

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)NSLayoutConstraint *layoutspinnertop;

@end
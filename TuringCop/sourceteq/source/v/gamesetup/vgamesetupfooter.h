#import "appdel.h"

@class vgamesetup;

@interface vgamesetupfooter:UICollectionReusableView

-(void)config:(vgamesetup*)view;

@property(weak, nonatomic)vgamesetup *view;

@end
#import "appdel.h"

@class mgamearea;

@interface vgamesetuplocator:UIView<CLLocationManagerDelegate>

@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(strong, nonatomic)mgamearea *gamearea;

@end
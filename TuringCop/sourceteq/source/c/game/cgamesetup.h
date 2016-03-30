#import "appdel.h"

@class mgamearea;

@interface cgamesetup:UIViewController<CLLocationManagerDelegate>

-(void)startgame;
-(void)cancelgame;

@property(strong, nonatomic)mgamearea *model;
@property(strong, nonatomic)CLLocationManager *locationmanager;

@end
#import "appdel.h"

@class timerbg;
@class cplay;
@class mchallenge;

@interface cplayitem:UIViewController<UIAlertViewDelegate, timerbgdel>

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge;
-(void)start;
-(void)startclock;
-(void)submit;
-(void)back;
-(void)displaytime;

@property(weak, nonatomic)cplay *play;
@property(strong, nonatomic)mchallenge *challenge;
@property(weak, nonatomic)timerbg *timer;
@property(nonatomic)BOOL submited;
@property(nonatomic)BOOL activated;

@end
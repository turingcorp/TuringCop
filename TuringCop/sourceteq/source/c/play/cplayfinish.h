#import "appdel.h"

@class cplay;

@interface cplayfinish:UIViewController

-(instancetype)init:(cplay*)play;
-(void)done;

@property(weak, nonatomic)cplay *play;

@end
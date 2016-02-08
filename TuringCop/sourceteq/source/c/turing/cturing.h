#import "appdel.h"

@class cpages;

@interface cturing:UIViewController

-(instancetype)init:(cpages*)pages;
-(void)stoptest;

@property(weak, nonatomic)cpages *pages;

@end
#import "appdel.h"

@class cpages;

@interface cstatus:UIViewController

-(instancetype)init:(cpages*)pages;
-(void)taketest;

@property(weak, nonatomic)cpages *pages;

@end
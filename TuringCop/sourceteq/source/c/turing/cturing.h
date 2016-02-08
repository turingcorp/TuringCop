#import "appdel.h"

@class cpages;

@interface cturing:UIViewController

-(instancetype)init:(cpages*)pages;

@property(weak, nonatomic)cpages *pages;

@end
#import "appdel.h"

@class cpages;

@interface ccreator:UIViewController

-(instancetype)init:(cpages*)pages;

@property(weak, nonatomic)cpages *pages;

@end
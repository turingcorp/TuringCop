#import "appdel.h"

@class cpages;

@interface ccreator:UIViewController

-(instancetype)init:(cpages*)pages;
-(void)status;

@property(weak, nonatomic)cpages *pages;

@end
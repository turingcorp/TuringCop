#import "appdel.h"

@class cpages;

@interface ccreator:UIViewController

-(instancetype)init:(cpages*)pages;
-(void)status;
-(void)add;

@property(weak, nonatomic)cpages *pages;

@end
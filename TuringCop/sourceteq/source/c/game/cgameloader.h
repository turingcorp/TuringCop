#import "appdel.h"

@class mgame;
@class mgamearea;

@interface cgameloader:UIViewController

-(instancetype)init:(mgamearea*)modelarea;
-(void)loadingfinished;

@property(strong, nonatomic)mgame *model;
@property(strong, nonatomic)mgamearea *modelarea;

@end
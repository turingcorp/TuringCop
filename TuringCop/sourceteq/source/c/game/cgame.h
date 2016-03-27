#import "appdel.h"

@class mgamearea;

@interface cgame:GLKViewController<GLKViewControllerDelegate>

-(instancetype)init:(mgamearea*)modelarea;

@property(strong, nonatomic)mgamearea *modelarea;

@end
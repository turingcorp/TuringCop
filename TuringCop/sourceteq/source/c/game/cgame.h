#import "appdel.h"

@class mgame;

@interface cgame:GLKViewController<GLKViewControllerDelegate>

-(instancetype)init:(mgame*)model;

@property(strong, nonatomic)mgame *model;

@end
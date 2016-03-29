#import "appdel.h"

@class mgame;
@class garea;
@class gfoe;

@interface cgame:GLKViewController<GLKViewControllerDelegate>

-(instancetype)init:(mgamearea*)modelarea;

@property(strong, nonatomic)garea *glkarea;
@property(strong, nonatomic)gfoe *glkfoe;

@end
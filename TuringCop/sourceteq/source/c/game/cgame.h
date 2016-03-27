#import "appdel.h"

@class mgamearea;
@class mfoe;
@class garea;
@class gfoe;

@interface cgame:GLKViewController

-(instancetype)init:(mgamearea*)modelarea;

@property(strong, nonatomic)mgamearea *modelarea;
@property(strong, nonatomic)mfoe *modelfoe;
@property(strong, nonatomic)garea *glkarea;
@property(strong, nonatomic)gfoe *glkfoe;

@end
#import "appdel.h"

@class mgamearea;
@class mfoe;

@interface mgame:NSObject

-(instancetype)init:(mgamearea*)modelarea;

@property(strong, nonatomic)EAGLContext *context;
@property(strong, nonatomic)mgamearea *modelarea;
@property(strong, nonatomic)mfoe *modelfoe;

@end
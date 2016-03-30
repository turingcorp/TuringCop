#import "appdel.h"

@class cgameloader;
@class mgamearea;
@class mfoe;
@class mbuilding;

@interface mgame:NSObject

-(instancetype)init:(cgameloader*)controller;

@property(strong, nonatomic)EAGLContext *context;
@property(strong, nonatomic)mgamearea *modelarea;
@property(strong, nonatomic)mfoe *modelfoe;
@property(strong, nonatomic)mbuilding *modelbuilding;

@end
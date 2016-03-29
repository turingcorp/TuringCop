#import "appdel.h"

@class cgameloader;
@class mgamearea;
@class mfoe;

@interface mgame:NSObject

-(instancetype)init:(cgameloader*)controller;

@property(strong, nonatomic)EAGLContext *context;
@property(strong, nonatomic)mgamearea *modelarea;
@property(strong, nonatomic)mfoe *modelfoe;

@end
#import "appdel.h"

@class mgamesetupitem;
@class mgamearea;

@interface mgamesetup:NSObject

-(mgamearea*)modelarea;

@property(strong, nonatomic)NSArray<mgamesetupitem*> *items;

@end
#import "appdel.h"

@class ccreator;

@protocol mcreatorheaderprotocol<NSObject>

-(NSString*)title;
-(void)action:(ccreator*)controller;

@end
#import "appdel.h"

@interface ctoast:UIViewController

+(void)toast:(NSString*)message;
-(void)dismiss;

@property(copy, nonatomic)NSString *message;

@end
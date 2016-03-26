#import "appdel.h"

@class mstorepurchases;
@class mstore;

@interface cstore:UIViewController

+(void)show;
-(void)back;

@property(strong, nonatomic)mstore *model;

@end
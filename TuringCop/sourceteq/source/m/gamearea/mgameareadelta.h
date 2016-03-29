#import "appdel.h"

@interface mgameareadelta:NSDictionary

-(instancetype)init:(CGFloat)x y:(CGFloat)y;

@property(nonatomic, readonly)CGFloat deltax;
@property(nonatomic, readonly)CGFloat deltay;

@end
#import "appdel.h"

@interface mgameeffect:NSDictionary

-(instancetype)init:(GLKBaseEffect*)effect;

@property(weak, nonatomic)GLKBaseEffect *effect;

@end
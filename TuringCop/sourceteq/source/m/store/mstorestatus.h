#import <UIKit/UIKit.h>

@class vstorecell;

@interface mstorestatus:NSObject

-(void)config:(vstorecell*)cell;

@property(copy, nonatomic)NSString *name;

@end
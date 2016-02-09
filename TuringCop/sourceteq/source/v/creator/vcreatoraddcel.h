#import <UIKit/UIKit.h>

@class mcreatoradditem;

@interface vcreatoraddcel:UICollectionViewCell

-(void)config:(mcreatoradditem*)model;

@property(weak, nonatomic)mcreatoradditem *model;

@end
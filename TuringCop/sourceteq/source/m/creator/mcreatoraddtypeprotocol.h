#import <UIKit/UIKit.h>

@class mcreatoradditem;

@protocol mcreatoraddtypeprotocol <NSObject>

-(mcreatoradditem*)itemtype;
-(void)registercells:(UICollectionView*)collection;

@end
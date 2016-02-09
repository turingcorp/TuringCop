#import "appdel.h"
#import "viewbase.h"

@class mcreatoradd;

@interface vcreatoradd:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)reload;

@property(strong, nonatomic)mcreatoradd *model;
@property(weak, nonatomic)UICollectionView *collection;

@end
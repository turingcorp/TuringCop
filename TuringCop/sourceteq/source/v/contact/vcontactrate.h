#import "appdel.h"
#import "vcontactcell.h"

@class mcontactrate;

@interface vcontactrate:vcontactcell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcontactrate *model;
@property(weak, nonatomic)UICollectionView *collection;

@end
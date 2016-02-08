#import "appdel.h"
#import "viewbase.h"

@class vstatusbar;

@interface vstatus:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vstatusbar *statusbar;
@property(weak, nonatomic)UICollectionView *collection;

@end
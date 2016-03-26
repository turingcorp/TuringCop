#import "appdel.h"
#import "viewbase.h"

@interface vstore:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UIButton *buttontryagain;
@property(weak, nonatomic)UIActivityIndicatorView *spinner;

@end
#import "appdel.h"
#import "viewbase.h"

@class vcontactheader;
@class mcontact;

@interface vcontact:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcontact *model;
@property(weak, nonatomic)vcontactheader *header;
@property(weak, nonatomic)NSLayoutConstraint *layoutcollectionbottom;
@property(weak, nonatomic)NSLayoutConstraint *layoutheaderheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutheadertop;
@property(weak, nonatomic)UICollectionView *collection;

@end
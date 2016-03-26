#import "appdel.h"
#import "viewbase.h"

@class mgamesetup;

@interface vgamesetup:viewbase<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mgamesetup *model;

@end
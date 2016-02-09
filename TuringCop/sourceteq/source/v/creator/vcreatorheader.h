#import "appdel.h"

@class mcreatorheader;

@interface vcreatorheader:UICollectionReusableView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcreatorheader *model;

@end
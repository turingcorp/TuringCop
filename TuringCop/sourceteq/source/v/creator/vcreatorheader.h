#import "appdel.h"

@class mcreatorheader;
@class ccreator;

@interface vcreatorheader:UICollectionReusableView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcreatorheader *model;
@property(weak, nonatomic)ccreator *controller;

@end
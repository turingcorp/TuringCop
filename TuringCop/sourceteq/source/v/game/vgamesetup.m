#import "vgamesetup.h"

@interface vgamesetup ()

@property(weak, nonatomic)cgamesetup *controller;

@end

@implementation vgamesetup

@dynamic controller;

-(instancetype)init:(cgamesetup*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setSectionInset:UIEdgeInsetsZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:collection];
    
    return self;
}

@end
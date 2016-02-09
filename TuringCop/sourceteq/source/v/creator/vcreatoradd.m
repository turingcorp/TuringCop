#import "vcreatoradd.h"

@implementation vcreatoradd

-(instancetype)init:(ccreatoradd*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    self.model = [[mcreatoradd alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:10];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(10, 0, 20, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vcreatoraddheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    [collection registerClass:[vcreatoraddfooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerid];
    self.collection = collection;
    
    [self.model.type registercells:collection];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)reload
{
    [self.collection reloadData];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(col.bounds.size.width, 100);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(col.bounds.size.width, 200);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, 60);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.model count];
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    UICollectionReusableView *reusable;
    
    if(kind == UICollectionElementKindSectionHeader)
    {
        reusable = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
        ((vcreatoraddheader*)reusable).creatoradd = self;
    }
    else
    {
        reusable = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerid forIndexPath:index];
    }
    
    return reusable;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcreatoraddcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

@end
#import "vcontactrate.h"

static NSString* const ratecell = @"cellid";
static NSUInteger const colheight = 200;
static NSUInteger const cellwidth = 55;

@implementation vcontactrate
{
    CGFloat cellshorizontal;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.model = [[mcontactrate alloc] init];
    cellshorizontal = cellwidth * self.model.stars.count;

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setFont:[UIFont fontWithName:fontregularname size:20]];
    [label setTextColor:colorthird];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:NSLocalizedString(@"contact_rate_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(cellwidth, colheight)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vcontactratecell class] forCellWithReuseIdentifier:ratecell];
    [collection setAllowsSelection:YES];
    self.collection = collection;
    
    [self addSubview:label];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"label":label, @"col":collection};
    NSDictionary *metrics = @{@"colheight":@(colheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(colheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat totalwidth = col.bounds.size.width;
    CGFloat remaining = totalwidth - cellshorizontal;
    CGFloat margin = remaining / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.stars.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcontactratecell *cell = [col dequeueReusableCellWithReuseIdentifier:ratecell forIndexPath:index];
    [cell hover:self.model.stars[index.item].selected];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger stars = index.item + 1;
    
    [self.model selectstar:stars];
    [self.collection reloadData];
    
    [valert alert:NSLocalizedString(@"contact_rate_rated", nil) inview:self.viewcontact offsettop:0];
    [msettings singleton].starsrated = stars;
    [[msettings singleton] save];
    
    [[analytics singleton] trackevent:ga_event_rate action:ga_action_optin label:[NSString stringWithFormat:@"%@", @(stars)]];
}

@end
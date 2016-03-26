#import "vcontact.h"

static NSUInteger const headermaxheight = 200;
static NSUInteger const headerminheight = 150;

@interface vcontact ()

@property(weak, nonatomic)ccontact *controller;

@end

@implementation vcontact

@dynamic controller;

-(instancetype)init:(ccontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    self.model = [[mcontact alloc] init];
    
    vcontactheader *header = [[vcontactheader alloc] init:controller];
    self.header = header;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setSectionInset:UIEdgeInsetsMake(headermaxheight, 0, 40, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    [self.model registercollection:collection];
    
    [self addSubview:collection];
    [self addSubview:header];
    
    NSDictionary *views = @{@"header":header, @"col":collection};
    NSDictionary *metrics = @{};
    
    self.layoutcollectionbottom = [NSLayoutConstraint constraintWithItem:collection attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    self.layoutheaderheight = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:headermaxheight];
    self.layoutheadertop = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutheaderheight];
    [self addConstraint:self.layoutheadertop];
    [self addConstraint:self.layoutcollectionbottom];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedkeyboardchange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGFloat ypos;
    CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat origin = keyrect.origin.y;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(origin < screenheight)
    {
        ypos = -(screenheight - origin);
    }
    else
    {
        ypos = 0;
    }
    
    self.layoutcollectionbottom.constant = ypos;
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self layoutIfNeeded];
     }];
}

#pragma mark -
#pragma mark scroll del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat firedelta = fabs(offsety) / 2.0;
    CGFloat newheaderheight = headermaxheight - offsety;
    CGFloat newheadertop = 0;
    CGFloat newfireheight = self.header.fireinitialheight + firedelta;
    CGFloat newrocketbottom = self.header.fireinitialheight + (firedelta / 2);
    CGFloat firealpha = fabs(offsety) / 100.0;
    
    if(firealpha > 1)
    {
        firealpha = 1;
    }
    
    if(newheaderheight < headerminheight)
    {
        CGFloat delta = headerminheight - newheaderheight;
        newheaderheight = headerminheight;
        newheadertop = -delta;
    }
    
    self.layoutheaderheight.constant = newheaderheight;
    self.layoutheadertop.constant = newheadertop;
    self.header.layoutfireheight.constant = newfireheight;
    self.header.layoutrocketbottom.constant = -newrocketbottom;
    [self.header.imagefire setAlpha:firealpha];
}

#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = self.model.items[index.item].cellheight;
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mcontactitem *model = self.model.items[index.item];
    vcontactcell *cell = [col dequeueReusableCellWithReuseIdentifier:model.reusableid forIndexPath:index];
    cell.viewcontact = self;
    
    return cell;
}

@end
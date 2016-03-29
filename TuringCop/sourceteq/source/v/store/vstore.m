#import "vstore.h"

static NSString* const storecell = @"celid";
static NSUInteger const cellheight = 170;

@interface vstore ()

@property(weak, nonatomic)cstore *controller;

@end

@implementation vstore

@dynamic controller;

-(instancetype)init:(cstore*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor second]];
    
    vstorebar *bar = [[vstorebar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setSectionInset:UIEdgeInsetsMake(2, 0, 40, 0)];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vstorecell class] forCellWithReuseIdentifier:storecell];
    [collection setHidden:YES];
    self.collection = collection;
    
    UIButton *buttontryagain = [[UIButton alloc] init];
    [buttontryagain setBackgroundColor:[UIColor main]];
    [buttontryagain setClipsToBounds:YES];
    [buttontryagain.layer setCornerRadius:4];
    [buttontryagain setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttontryagain setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttontryagain.titleLabel setFont:[UIFont regularsize:16]];
    [buttontryagain setTitle:NSLocalizedString(@"store_tryagain", nil) forState:UIControlStateNormal];
    [buttontryagain setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttontryagain setHidden:YES];
    [buttontryagain addTarget:self action:@selector(actiontryagain:) forControlEvents:UIControlEventTouchUpInside];
    self.buttontryagain = buttontryagain;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    [spinner startAnimating];
    self.spinner = spinner;
    
    [self addSubview:collection];
    [self addSubview:buttontryagain];
    [self addSubview:spinner];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection, @"spinner":spinner, @"button":buttontryagain};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[button]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-170-[button(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(65)]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdatepurchases:) name:notification_purchaseupd object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdatepurchases:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.spinner stopAnimating];
                       [self.collection reloadData];
                       
                       if(self.controller.model.error)
                       {
//                           [valert alert:self.controller.model.error inview:self offsettop:65];
                           [self.buttontryagain setHidden:NO];
                           [self.collection setHidden:YES];
                       }
                       else
                       {
                           [self.buttontryagain setHidden:YES];
                           [self.collection setHidden:NO];
                       }
                   });
}

#pragma mark actions

-(void)actiontryagain:(UIButton*)button
{
    [self.spinner startAnimating];
    [self.buttontryagain setHidden:YES];
    [self.controller.model checkavailabilities];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.controller.model.purchases.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mstorepurchasesitem *item = self.controller.model.purchases.items[index.item];
    
    vstorecell *cell = [col dequeueReusableCellWithReuseIdentifier:storecell forIndexPath:index];
    [cell config:item];
    
    [item.status config:cell];
    
    return cell;
}

@end
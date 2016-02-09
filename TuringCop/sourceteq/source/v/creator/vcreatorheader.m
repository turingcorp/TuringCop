#import "vcreatorheader.h"

@implementation vcreatorheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = [[mcreatorheader alloc] init];
    
    UICollectionViewFlowLayout *flow
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[button(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(38)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.model count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcreatorheadercel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

@end
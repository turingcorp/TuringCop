#import "mcreatoraddtypeimage.h"

@implementation mcreatoraddtypeimage

#pragma mark -
#pragma mark type protocol

-(mcreatoradditem*)itemtype
{
    mcreatoradditemimage *item = [[mcreatoradditemimage alloc] init];
    
    return item;
}

-(void)registercells:(UICollectionView*)collection
{
    
}

@end
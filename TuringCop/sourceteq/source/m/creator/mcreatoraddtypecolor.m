#import "mcreatoraddtypecolor.h"

@implementation mcreatoraddtypecolor

#pragma mark -
#pragma mark type protocol

-(mcreatoradditem*)itemtype
{
    mcreatoradditemcolor *item = [[mcreatoradditemcolor alloc] init];
    
    return item;
}

-(void)registercells:(UICollectionView*)collection
{
    
}

@end
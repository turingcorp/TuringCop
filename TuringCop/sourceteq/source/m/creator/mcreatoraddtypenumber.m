#import "mcreatoraddtypenumber.h"

@implementation mcreatoraddtypenumber

#pragma mark -
#pragma mark type protocol

-(mcreatoradditem*)itemtype
{
    mcreatoradditemnumber *item = [[mcreatoradditemnumber alloc] init];
    
    return item;
}

-(void)registercells:(UICollectionView*)collection
{
    
}

@end
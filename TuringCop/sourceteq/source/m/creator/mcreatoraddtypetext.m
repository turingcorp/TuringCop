#import "mcreatoraddtypetext.h"

@implementation mcreatoraddtypetext

#pragma mark -
#pragma mark type protocol

-(mcreatoradditem*)itemtype
{
    mcreatoradditemtext *item = [[mcreatoradditemtext alloc] init];
    
    return item;
}

-(void)registercells:(UICollectionView*)collection
{
    
}

@end
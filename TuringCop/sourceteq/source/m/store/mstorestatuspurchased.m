#import "mstorestatuspurchased.h"

@implementation mstorestatuspurchased

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_purchased", nil);
    
    return self;
}

#pragma mark -
#pragma mark status cell

-(void)config:(vstorecell*)cell
{
    [cell.button setHidden:YES];
    [cell.statuslabel setHidden:YES];
    
    if(cell.item.skproduct)
    {
        [cell.statusicon setHidden:NO];
    }
    else
    {
        [cell.statusicon setHidden:YES];
    }
}

@end
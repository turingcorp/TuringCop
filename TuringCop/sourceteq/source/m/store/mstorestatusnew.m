#import "mstorestatusnew.h"

@implementation mstorestatusnew

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_new", nil);
    
    return self;
}

#pragma mark -
#pragma mark status cell

-(void)config:(vstorecell*)cell
{
    [cell.statuslabel setHidden:YES];
    [cell.statusicon setHidden:YES];
    
    if(cell.item.skproduct)
    {
        [cell.button setHidden:NO];
    }
    else
    {
        [cell.button setHidden:YES];
    }
}

@end
#import "mstorestatusdeferred.h"

@implementation mstorestatusdeferred

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_deferred", nil);
    
    return self;
}

#pragma mark -
#pragma mark status cell

-(void)config:(vstorecell*)cell
{
    [cell.button setHidden:YES];
    [cell.statuslabel setText:self.name];
    [cell.statusicon setHidden:YES];
    
    if(cell.item.skproduct)
    {
        [cell.statuslabel setHidden:NO];
    }
    else
    {
        [cell.statuslabel setHidden:YES];
    }
}

@end
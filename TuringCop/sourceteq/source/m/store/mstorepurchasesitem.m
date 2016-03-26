#import "mstorepurchasesitem.h"

@implementation mstorepurchasesitem

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:self.itemtitle];
    [string appendFormat:@":%@", self.itemdescr];
    [string appendFormat:@":%@", self.pricestring];
    [string appendFormat:@":%@", self.status.name];
    
    return string;
}

#pragma mark public

-(void)purchase
{
    [[analytics singleton] trackevent:ga_event_purchase action:ga_action_optin label:self.itemid];
    [mstore purchase:self.skproduct];
}

@end
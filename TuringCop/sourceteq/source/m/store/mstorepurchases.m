#import "mstorepurchases.h"

static NSUInteger const itemtitlesize = 17;
static NSUInteger const itemdescrsize = 17;
static NSUInteger const itempricesize = 14;

@implementation mstorepurchases

-(instancetype)init
{
    self = [super init];
    
    self.priceformater = [[NSNumberFormatter alloc] init];
    [self.priceformater setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.dictitems = [NSMutableDictionary dictionary];
    self.items = [NSMutableArray array];
    self.asset = [NSMutableSet set];
    
    NSArray *rawitems = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"purchases" withExtension:@"plist"]];
    NSUInteger qtyitems = rawitems.count;
    
    for(NSUInteger i = 0; i < qtyitems; i++)
    {
        NSDictionary *rawitem = rawitems[i];
        NSString *itemid = rawitem[@"id"];
        NSString *itemtitle = rawitem[@"title"];
        NSString *itemdescr = rawitem[@"descr"];
        NSString *courseclass = rawitem[@"courseclass"];
        
        mstorepurchasesitem *item = [[mstorepurchasesitem alloc] init];
        item.itemid = itemid;
        item.itemtitle = NSLocalizedString(itemtitle, nil);
        item.itemdescr = NSLocalizedString(itemdescr, nil);
        item.status = [[mstorestatusnew alloc] init];
        item.courseclass = courseclass;
        
        self.dictitems[itemid] = item;
        [self.items addObject:item];
        [self.asset addObject:itemid];
    }
    
    return self;
}

#pragma mark public

-(void)loadskproduct:(SKProduct*)skproduct
{
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:itemtitlesize], NSForegroundColorAttributeName:[UIColor main]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:itemdescrsize], NSForegroundColorAttributeName:[UIColor second]};
    NSDictionary *dictprice = @{NSFontAttributeName:[UIFont boldsize:itempricesize], NSForegroundColorAttributeName:[UIColor blackColor]};
    
    NSString *prodid = skproduct.productIdentifier;
    mstorepurchasesitem *initem = self.dictitems[prodid];
    
    if(initem)
    {
        [self.priceformater setLocale:skproduct.priceLocale];
        NSString *strprice = [self.priceformater stringFromNumber:skproduct.price];
        initem.pricestring = strprice;
        initem.skproduct = skproduct;
        
        NSString *stringtitle = initem.itemtitle;
        NSString *stringdescr = [NSString stringWithFormat:@"\n%@", initem.itemdescr];
        NSString *stringprice = [NSString stringWithFormat:@"\n%@", strprice];
        
        NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
        NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:stringdescr attributes:dictdescr];
        NSAttributedString *attrprice = [[NSAttributedString alloc] initWithString:stringprice attributes:dictprice];
        
        NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
        [mut appendAttributedString:attrtitle];
        [mut appendAttributedString:attrdescr];
        [mut appendAttributedString:attrprice];
        initem.attributestring = mut;
    }
}


-(void)updatetransactions:(NSArray<SKPaymentTransaction*>*)transactions
{
    NSUInteger qty = transactions.count;
    for(NSUInteger i = 0; i < qty; i++)
    {
        SKPaymentTransaction *tran = transactions[i];
        NSString *prodid = tran.payment.productIdentifier;
        mstorepurchasesitem *item = self.dictitems[prodid];

        if(item)
        {
            switch(tran.transactionState)
            {
                case SKPaymentTransactionStateDeferred:
                    
                    item.status = [[mstorestatusdeferred alloc] init];
                    
                    break;
                    
                case SKPaymentTransactionStateFailed:
                    
                    item.status = [[mstorestatusnew alloc] init];
                    [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                    
                    break;
                    
                case SKPaymentTransactionStatePurchased:
                    
                    item.status = [[mstorestatuspurchased alloc] init];
//                    [mcourse opencourse:NSClassFromString(item.courseclass)];
                    [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                    
                    break;
                    
                case SKPaymentTransactionStatePurchasing:
                    
                    item.status = [[mstorestatuspurchasing alloc] init];
                    
                    break;
                    
                case SKPaymentTransactionStateRestored:
                    
                    item.status = [[mstorestatuspurchased alloc] init];
//                    [mcourse opencourse:NSClassFromString(item.courseclass)];
                    [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                    
                    break;
            }
        }
    }
}

@end
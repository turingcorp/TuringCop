#import "appdel.h"

@class mstorestatus;

@interface mstorepurchasesitem:NSObject

-(void)purchase;

@property(strong, nonatomic)mstorestatus *status;
@property(strong, nonatomic)SKProduct *skproduct;
@property(strong, nonatomic)NSAttributedString *attributestring;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemdescr;
@property(copy, nonatomic)NSString *courseclass;
@property(copy, nonatomic)NSString *pricestring;

@end
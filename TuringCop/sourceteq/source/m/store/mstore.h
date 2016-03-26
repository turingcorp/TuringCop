#import "appdel.h"

@class mstorepurchases;

@interface mstore:NSObject<SKProductsRequestDelegate, SKPaymentTransactionObserver, SKRequestDelegate>

+(instancetype)singleton;
+(void)purchase:(SKProduct*)product;
-(void)checkavailabilities;
-(void)restorepurchases;

@property(strong, nonatomic)mstorepurchases *purchases;
@property(strong, nonatomic)NSNotification *notification;
@property(copy, nonatomic)NSString *error;

@end
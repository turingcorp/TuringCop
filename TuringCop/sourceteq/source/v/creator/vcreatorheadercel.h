#import "appdel.h"
#import "mcreatorheaderprotocol.h"

@interface vcreatorheadercel:UICollectionViewCell

-(void)config:(id<mcreatorheaderprotocol>)model;

@property(weak, nonatomic)UILabel *label;

@end
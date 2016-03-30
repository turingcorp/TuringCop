#import "mbuildingitem.h"

@implementation mbuildingitem

-(instancetype)init:(NSDictionary*)dictionary x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.spatial = [[gbuildingitem alloc] init:self];
    self.assetname = dictionary[@"asset"];
    self.width = [dictionary[@"width"] floatValue];
    self.height = [dictionary[@"height"] floatValue];
    self.x = x;
    self.y = y;
    
    return self;
}

@end
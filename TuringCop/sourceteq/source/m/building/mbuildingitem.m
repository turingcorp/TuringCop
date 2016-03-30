#import "mbuildingitem.h"

@implementation mbuildingitem

-(instancetype)init
{
    self = [super init];
    self.spatial = [[gbuildingitem alloc] init:self];
    
    return self;
}

@end
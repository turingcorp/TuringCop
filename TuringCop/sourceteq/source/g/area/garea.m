#import "garea.h"

@implementation garea

-(instancetype)init:(mgamearea*)model
{
    self = [super init];
    self.model = model;
    self.spatial = [[gareaspatial alloc] init];
    
    return self;
}

@end
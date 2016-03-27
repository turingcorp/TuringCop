#import "gareaspatial.h"

@implementation gareaspatial

-(instancetype)init:(mgamearea*)model
{
    self = [super init];
    self.model = model;
    self.x = 0;
    self.y = 0;
    self.width = 2000;
    self.height = 2000;
    [self.image loadtextureimage:model.image];
    [self render];
    
    return self;
}

@end
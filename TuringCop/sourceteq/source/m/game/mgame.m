#import "mgame.h"

@implementation mgame

-(instancetype)init:(mgamearea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    
    return self;
}

@end
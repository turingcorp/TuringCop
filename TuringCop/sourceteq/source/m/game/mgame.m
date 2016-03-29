#import "mgame.h"

@implementation mgame

-(instancetype)init:(mgamearea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    
    [self loadall];
    
    return self;
}

#pragma mark functionality

-(void)loadall
{
    [self.modelarea loadarea];
}

@end
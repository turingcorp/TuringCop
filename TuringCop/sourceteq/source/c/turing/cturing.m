#import "cturing.h"

@implementation cturing

-(instancetype)init:(cpages*)pages
{
    self = [super init];
    
    self.pages = pages;
    
    return self;
}

-(void)loadView
{
    self.view = [[vturing alloc] init:self];
}

@end
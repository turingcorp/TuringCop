#import "cstatus.h"

@implementation cstatus

-(instancetype)init:(cpages*)pages;
{
    self = [super init];
    
    self.pages = pages;
    
    return self;
}

-(void)loadView
{
    self.view = [[vstatus alloc] init:self];
}

#pragma mark public

-(void)taketest
{
    [self.pages setViewControllers:@[[[cturing alloc] init:self.pages]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

@end
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

#pragma mark public

-(void)stoptest
{
    [self.pages setViewControllers:@[[[cstatus alloc] init:self.pages]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

@end
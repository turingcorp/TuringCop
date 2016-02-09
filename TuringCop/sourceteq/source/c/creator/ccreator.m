#import "ccreator.h"

@implementation ccreator

-(instancetype)init:(cpages*)pages
{
    self = [super init];
    
    self.pages = pages;
    
    return self;
}

-(void)loadView
{
    self.view = [[vcreator alloc] init:self];
}

#pragma mark public

-(void)status
{
    [self.pages setViewControllers:@[[[cstatus alloc] init:self.pages]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

-(void)add
{
    [self.navigationController pushViewController:[[ccreatoradd alloc] init] animated:YES];
}

@end
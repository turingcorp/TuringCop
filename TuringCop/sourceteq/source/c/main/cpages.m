#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self sectionhome:NO];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark actions

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

#pragma mark public

-(void)sectionhome:(BOOL)animated
{
    UIViewController *controller = [[chome alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:animated];
}

-(void)sectiongame
{
    UIViewController *controller = [[cgamesetup alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

@end
#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self sectionstats:UIPageViewControllerNavigationDirectionForward animated:NO];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark actions

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

#pragma mark public

-(void)sectionplay:(mcourseitemchapter*)chapter
{
    [self changecontroller:[[cplay alloc] init:chapter] direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)sectionstats:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self changecontroller:[[cstats alloc] init] direction:direction animated:animated];
}

-(void)sectionoptions
{
    [self changecontroller:[[coptions alloc] init] direction:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

@end
#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self sectionhome:NO direction:UIPageViewControllerNavigationDirectionForward];
    
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

-(void)sectionhome:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction
{
    UIViewController *controller = [[chome alloc] init];
    [self changecontroller:controller direction:direction animated:animated];
}

-(void)sectiongame
{
    UIViewController *controller = [[cgamesetup alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)sectiongameload:(mgamearea*)modelarea;
{
    UIViewController *controller = [[cgameloader alloc] init:modelarea];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)sectiongamestart:(mgame*)model
{
    UIViewController *controller = [[cgame alloc] init:model];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

@end
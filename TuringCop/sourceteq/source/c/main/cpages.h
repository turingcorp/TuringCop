#import "appdel.h"

@class mgamearea;
@class mgame;

@interface cpages:UIPageViewController

-(void)sectionhome:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction;
-(void)sectiongame;
-(void)sectiongameload:(mgamearea*)modelarea;
-(void)sectiongamestart:(mgame*)model;

@end
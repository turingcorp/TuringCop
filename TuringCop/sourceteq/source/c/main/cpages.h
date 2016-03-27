#import "appdel.h"

@class mgamearea;

@interface cpages:UIPageViewController

-(void)sectionhome:(BOOL)animated;
-(void)sectiongame;
-(void)sectiongamestart:(mgamearea*)modelarea;

@end
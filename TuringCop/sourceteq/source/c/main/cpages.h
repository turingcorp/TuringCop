#import "appdel.h"

@class mgamearea;
@class mgame;

@interface cpages:UIPageViewController

-(void)sectionhome:(BOOL)animated;
-(void)sectiongame;
-(void)sectiongameload:(mgamearea*)modelarea;
-(void)sectiongamestart:(mgame*)model;

@end
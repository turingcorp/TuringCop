#import "cgame.h"

static NSUInteger const framespersecond = 60;

@implementation cgame

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:YES];
    [self setDelegate:self];
}

#pragma mark -
#pragma mark glkcontroller del

-(void)glkViewController:(GLKViewController*)controller willPause:(BOOL)pause
{
    NSLog(@"will pause");
}

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
//    [[NSNotificationCenter defaultCenter] postNotification:notificationmove];
}

@end
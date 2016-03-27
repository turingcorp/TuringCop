#import "cgamedelegate.h"

@implementation cgamedelegate

#pragma mark -
#pragma mark glk del

-(void)glkViewController:(GLKViewController*)controller willPause:(BOOL)pause
{
    NSLog(@"will pause");
}

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    //    [[NSNotificationCenter defaultCenter] postNotification:notificationmove];
}

@end
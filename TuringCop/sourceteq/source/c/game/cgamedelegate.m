#import "cgamedelegate.h"

@implementation cgamedelegate
{
    NSNotification *notificationmove;
}

-(instancetype)init
{
    self = [super init];
    notificationmove = [NSNotification notificationWithName:notification_glkmove object:nil];
    
    return self;
}

#pragma mark -
#pragma mark glk del

-(void)glkViewController:(GLKViewController*)controller willPause:(BOOL)pause
{
    NSLog(@"will pause");
}

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [[NSNotificationCenter defaultCenter] postNotification:notificationmove];
}

@end
#import "cgame.h"

static NSUInteger const framespersecond = 60;

@interface cgame ()

@property(strong, nonatomic)vgame *view;

@end

@implementation cgame

@dynamic view;
@dynamic delegate;

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:YES];
    [self setDelegate:self];
}

-(void)loadView
{
    self.view = [[vgame alloc] init:self];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark functionality

-(void)notifymove
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkmove object:nil userInfo:nil];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewController:(GLKViewController*)controller willPause:(BOOL)pause
{
    NSLog(@"will pause");
}

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [self notifymove];
}

@end
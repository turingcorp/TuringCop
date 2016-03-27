#import "cgame.h"

static NSUInteger const framespersecond = 60;

@interface cgame ()

@property(strong, nonatomic)vgame *view;

@end

@implementation cgame

@dynamic view;

-(instancetype)init:(mgamearea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:YES];
    [self setDelegate:self];
    [self startglk];
}

-(void)loadView
{
    self.view = [[vgame alloc] init:self];
}

#pragma mark functionality

-(void)startglk
{
    self.glkarea = [[garea alloc] init:self.modelarea];
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
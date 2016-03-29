#import "cgame.h"

static NSUInteger const framespersecond = 60;

@interface cgame ()

@property(strong, nonatomic)vgame *view;

@end

@implementation cgame
{
    NSNotification *notificationmove;
}

@dynamic view;
@dynamic delegate;

-(instancetype)init:(mgamearea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    notificationmove = [NSNotification notificationWithName:notification_glkmove object:nil];
    
    [self startmodel];
    [self startglk];
    
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

#pragma mark functionality

-(void)startmodel
{
    self.modelfoe = [[mfoe alloc] init];
}

-(void)startglk
{
    self.glkarea = [[garea alloc] init:self.modelarea];
    self.glkfoe = [[gfoe alloc] init:self.modelfoe];
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
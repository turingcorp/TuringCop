#import "cgame.h"

static NSUInteger const framespersecond = 60;

@implementation cgame

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
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
    [[NSNotificationCenter defaultCenter] postNotification:notificationmove];
}

@end



#import "ctrgame.h"

@implementation ctrgame
{
    timerbg *timer;
    NSNotification *notificationmove;
    NSInteger elapsedtime;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:60];
    [self setResumeOnDidBecomeActive:YES];
    [self setDelegate:self];
    
    notificationmove = [NSNotification notificationWithName:notgxmove object:nil];
    elapsedtime = 0;
    timer = [timerbg millis:10 leeway:1000 delegate:self background:NO];
}

-(void)viewDidAppear:(BOOL)_animated
{
    [super viewDidAppear:_animated];
    
    [analytics screen:screen_game];
    
    if(!self.beads)
    {
        [self initall];
    }
}

-(void)loadView
{
    self.view = [[vigame alloc] init];
    self.gameview = (vigame*)self.view;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return [[ctrmain sha] preferredStatusBarStyle];
}

-(BOOL)prefersStatusBarHidden
{
    return [[ctrmain sha] prefersStatusBarHidden];
}

#pragma mark functionality

-(void)initall
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       self.game = [[modgame alloc] init];
                       [self.gameview.hub.loadscreen start];
                       [[modarea sha] generate];
                       self.beams = [[modbeams alloc] init];
                       self.effects = [[modeffects alloc] init];
                       self.beads = [[modbeads alloc] init];
                       self.banners = [[modbanners alloc] init];
                       [self.beams generate];
                   });
}

#pragma mark public

-(void)loaded
{
    [self.gameview.hub stopload];
    [timer resume];
}

-(void)joinbeads
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       [self.game.score join:self.beads.mainbead.otherbead];
                       [self.banners bannerjoin];
                   });
}

-(void)checkgame
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       if([self.game.score lastscore].score < 1)
                       {
                           [self gameover];
                       }
                       else
                       {
                           [self.beads changepromoted];
                           [self.beads fill:YES];
                           [self.beams generate];
                       }
                   });
}

-(void)gameover
{
    [self setPaused:YES];
    [timer pause];
    [self.gameview.hub gameover];
}

#pragma mark -
#pragma mark glkcontroller del

-(void)glkViewControllerUpdate:(GLKViewController*)_controller
{
    [[NSNotificationCenter defaultCenter] postNotification:notificationmove];
}

#pragma mark timer del

-(void)timerbgtick
{
    elapsedtime++;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notticker object:nil userInfo:@{@"timestamp":@(elapsedtime)}];
}

@end
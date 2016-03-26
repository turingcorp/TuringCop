#import "cplayitem.h"

@interface cplayitem ()

@property(strong, nonatomic)vplayitem *view;

@end

@implementation cplayitem

@dynamic view;

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge
{
    self = [super init];

    self.submited = YES;
    self.activated = NO;
    self.play = play;
    self.challenge = challenge;
    self.timer = [timerbg millis:150 delegate:self background:NO];
    
    return self;
}

-(void)dealloc
{
    [self.timer pause];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_play];
}

-(void)loadView
{
    self.view = [[vplayitem alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)answer:(NSString*)answer
{
    double received = answer.doubleValue;
    double expected = self.challenge.trivia.value;
    
    if(received == expected)
    {
        NSInteger extratime = self.challenge.time.extratime + 1;
        NSUInteger score;
        
        if(extratime < 1)
        {
            extratime = 1;
        }
        
        score = self.challenge.chapter.index * extratime;
        [self.challenge.chapter success:score];
    }
    
    [self.play scorecomputed];
}

#pragma mark public

-(void)start
{
    [self.view.loader removeFromSuperview];
    [self.view.controls start];
    [self.view start];
    self.submited = NO;
    self.activated = YES;
}

-(void)startclock
{
    [self.challenge.time start];
    [self.timer resume];
}

-(void)submit
{
    if(!self.submited)
    {
        self.submited = YES;
        
        [self.timer pause];
        [self.challenge.time end];
        NSString *answer = self.view.controls.field.text;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           [self answer:answer];
                       });
        
        [self.play playnext:self.challenge.chapter.currentchallenge];
    }
}

-(void)back
{
    NSString *alerttitle = NSLocalizedString(@"play_back_alert_title", nil);
    NSString *alertmessage = NSLocalizedString(@"play_back_alert_message", nil);
    NSString *alertcancel = NSLocalizedString(@"play_back_alert_cancel", nil);
    NSString *alertaccept = NSLocalizedString(@"play_back_alert_accept", nil);
    
    [[[UIAlertView alloc] initWithTitle:alerttitle message:alertmessage delegate:self cancelButtonTitle:alertcancel otherButtonTitles:alertaccept, nil] show];
}

-(void)displaytime
{
    [self.view.bar print:self.challenge.time.extratime];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    self.submited = YES;
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if(index)
    {
        [[cmain singleton].pages sectionstats:UIPageViewControllerNavigationDirectionReverse animated:YES];
    }
    else
    {
        if(self.activated)
        {
            [self.timer resume];
            [self.view.controls reactivate];
            self.submited = NO;
        }
    }
}

#pragma mark timer bg

-(void)timerbgtick
{
    [self.challenge.time tick];
    
    if(self.challenge.time.extratime < 1)
    {
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        [self submit];
    }
    
    [self displaytime];
}

@end
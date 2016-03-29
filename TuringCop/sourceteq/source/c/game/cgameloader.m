#import "cgameloader.h"

@implementation cgameloader
{
    BOOL firsttime;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    firsttime = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(firsttime)
    {
        firsttime = NO;
        
        __weak typeof(self) weakself = self;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           [weakself startloading];
                       });
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)loadView
{
    self.view = [[vgameloader alloc] init:self];
}

#pragma mark functionality

-(void)startloading
{
    
}

@end
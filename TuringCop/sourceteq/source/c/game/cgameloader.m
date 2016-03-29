#import "cgameloader.h"

@interface cgameloader ()

@property(strong, nonatomic)vgameloader *view;

@end

@implementation cgameloader
{
    BOOL firsttime;
}

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
    __weak typeof(self) weakself = self;
    weakself.model = [[mgame alloc] init:weakself.modelarea];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [weakself loadingfinished];
                   });
}

-(void)loadingfinished
{
    [self.view loadfinished];
    [[cmain singleton].pages sectiongamestart:self.model];
}

@end
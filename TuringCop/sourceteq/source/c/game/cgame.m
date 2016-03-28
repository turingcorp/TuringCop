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
    [self setDelegate:[[cgamedelegate alloc] init]];
    [self startmodel];
    [self startglk];
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

@end
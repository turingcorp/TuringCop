#import "cgamesetup.h"

@interface cgamesetup ()

@property(strong, nonatomic)vgamesetup *view;

@end

@implementation cgamesetup

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)loadView
{
    self.view = [[vgamesetup alloc] init:self];
}

#pragma mark public

-(void)startgame
{
    [[cmain singleton].pages sectiongamestart];
}

@end
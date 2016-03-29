#import "cgameloader.h"

@implementation cgameloader

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

@end
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
//    [[cmain singleton].pages sectiongameload:[self.view.model modelarea]];
}

-(void)cancelgame
{
    [[cmain singleton].pages sectionhome:YES direction:UIPageViewControllerNavigationDirectionReverse];
}

@end
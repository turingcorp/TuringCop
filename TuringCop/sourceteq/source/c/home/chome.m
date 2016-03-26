#import "chome.h"

@interface chome ()

@property(strong, nonatomic)vhome *view;

@end

@implementation chome

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
    self.view = [[vhome alloc] init:self];
}

#pragma mark public

-(void)play
{
    [[cmain singleton].pages sectiongame];
}

@end
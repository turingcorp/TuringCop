#import "cmain.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super initWithRootViewController:[[cpages alloc] init]];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundColor:[UIColor blackColor]];
    [self.navigationBar setBarTintColor:[UIColor colorWithWhite:0.3 alpha:1]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontname size:15], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTranslucent:NO];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontname size:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
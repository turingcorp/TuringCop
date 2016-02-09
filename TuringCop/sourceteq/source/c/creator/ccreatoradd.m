#import "ccreatoradd.h"

@implementation ccreatoradd

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"creatoradd_title", nil)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)loadView
{
    self.view = [[vcreatoradd alloc] init:self];
}

@end
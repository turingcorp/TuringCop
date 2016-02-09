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
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
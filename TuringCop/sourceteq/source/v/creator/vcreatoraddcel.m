#import "vcreatoraddcel.h"

@implementation vcreatoraddcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    
    return self;
}

#pragma mark public

-(void)config:(mcreatoradditem*)model
{
    self.model = model;
}

@end
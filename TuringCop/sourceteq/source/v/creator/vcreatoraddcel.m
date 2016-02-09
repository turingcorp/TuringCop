#import "vcreatoraddcel.h"

@implementation vcreatoraddcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark public

-(void)config:(mcreatoradditem*)model
{
    self.model = model;
}

@end
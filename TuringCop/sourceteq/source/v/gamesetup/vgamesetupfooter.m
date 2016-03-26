#import "vgamesetupfooter.h"

@implementation vgamesetupfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIButton *buttonstart = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 200, 40)];
    [buttonstart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonstart setTitle:@"Start" forState:UIControlStateNormal];
    [buttonstart addTarget:self action:@selector(actionstart:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttonstart];
    
    return self;
}

#pragma mark actions

-(void)actionstart:(UIButton*)button
{
    [(cgamesetup*)self.view.controller startgame];
}

#pragma mark public

-(void)config:(vgamesetup*)view
{
    self.view = view;
}

@end
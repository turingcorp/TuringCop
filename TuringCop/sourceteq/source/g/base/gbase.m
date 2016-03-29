#import "gbase.h"
#import "appdel.h"

@implementation gbase

-(instancetype)init
{
    self = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkdraw:(NSNotification*)notification
{
    mgameeffect *modeleffect = (mgameeffect*)notification.userInfo;
    GLKBaseEffect *effect = modeleffect.effect;
    [self draw:effect];
}

#pragma mark public

-(void)draw:(GLKBaseEffect*)effect
{
    
}

@end
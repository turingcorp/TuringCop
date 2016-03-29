#import "gfoeshadow.h"

static NSUInteger const speed = 30;

@implementation gfoeshadow
{
    NSUInteger speedcounter;
}

-(instancetype)init:(gfoeitem*)foe
{
    self = [super init];
    self.foe = foe;
    self.height = 30;
    [self.image loadtextures:@[@"foe_shadow"]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter >= speed)
    {
        speedcounter = 0;
        [self moveshadow];
    }
}

#pragma mark functionality

-(void)moveshadow
{
    [self render];
}

@end
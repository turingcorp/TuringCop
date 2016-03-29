#import "gfoeitem.h"
#import "gfoeshadow.h"

static NSInteger floatmax = 30;
static NSUInteger floatspeed = 3;

@implementation gfoeitem
{
    NSUInteger floatcounter;
    NSInteger currentfloat;
}

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = 180;
    self.shadow = [[gfoeshadow alloc] init];
    floatcounter = 0;
    currentfloat = 0;
    
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
    floatcounter++;
    
    if(floatcounter >= floatspeed)
    {
        floatcounter = 0;
        [self floatovershadow];
    }
}

#pragma mark public

-(void)floatovershadow
{
    NSInteger delta = 0;
    NSUInteger shouldchange = arc4random_uniform(8);
    
    switch(shouldchange)
    {
        case 0:
            
            delta = -1;
            
            break;
            
        case 1:
            
            delta = 1;
            
            break;
            
        default:
            break;
    }
    
    if(delta)
    {
        BOOL changed = NO;
        currentfloat += delta;
        
        if(currentfloat < 0)
        {
            currentfloat = 0;
        }
        else if(currentfloat > floatmax)
        {
            currentfloat = floatmax;
        }
        else
        {
            changed = YES;
        }
        
        if(changed)
        {
            self.y = self.realy - self.height + currentfloat;
            [self render];
        }
    }
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    self.shadow.x = self.x + currentfloat;
    self.shadow.y = self.realy;
    self.shadow.width = self.width - (currentfloat * 2);
    
    [super render];
    [self.shadow render];
}

-(void)draw:(GLKBaseEffect*)effect
{
    [self.shadow draw:effect];
    [super draw:effect];
}

@end
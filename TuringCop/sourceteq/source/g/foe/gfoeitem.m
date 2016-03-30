#import "gfoeitem.h"
#import "gfoeshadow.h"

static CGFloat maxshadowheight = 30;
static CGFloat floatmoveratio = 30;
static NSInteger floatmax = 30;

@implementation gfoeitem
{
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
    currentfloat = 0;
    
    return self;
}

#pragma mark public

-(void)floatovershadow
{
    NSInteger delta = 0;
    NSUInteger shouldchange = arc4random_uniform(floatmoveratio);
    
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
            self.visualy = self.y - self.height + currentfloat;
        }
    }
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    [self floatovershadow];
    
    CGFloat currentfloat2 = currentfloat * 2;
    CGFloat shadowheight = maxshadowheight - currentfloat;
    
    if(shadowheight < 0)
    {
        shadowheight = 0;
    }
    
    self.shadow.x = self.x + currentfloat;
    self.shadow.y = self.y;
    self.shadow.width = self.width - currentfloat2;
    self.shadow.height = shadowheight;
    
    [super render];
    [self.shadow render];
}

-(void)draw:(GLKBaseEffect*)effect
{
    [self.shadow draw:effect];
    [super draw:effect];
}

-(void)screenmovedx:(CGFloat)x y:(CGFloat)y
{
    self.x -= x;
    self.y -= y;
    self.visualy -= y;
}

@end
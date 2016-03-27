#import "mgamesetupitemmap.h"

static NSUInteger const mapcellheight = 200;

@interface mgamesetupitemmap ()

@property(strong, nonatomic)vgamesetuplocator *locator;

@end

@implementation mgamesetupitemmap

-(instancetype)init
{
    self = [super init];
    self.cellheight = mapcellheight;
    
    return self;
}

#pragma mark public

-(mgamearea*)modelarea
{
    mgamearea *modelarea = self.locator.gamearea;
    
    return modelarea;
}

#pragma mark -
#pragma mark game setup

-(UIView*)overview
{
    if(!self.locator)
    {
        self.locator = [[vgamesetuplocator alloc] init];
    }
    
    return self.locator;
}

@end
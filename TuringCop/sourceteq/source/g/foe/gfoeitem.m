#import "gfoeitem.h"
#import "gfoeshadow.h"

@implementation gfoeitem

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = 100;
    self.shadow = [[gfoeshadow alloc] init:self];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    self.shadow.x = self.x;
    self.shadow.y = self.y + (self.height / 2.0);
    self.shadow.width = self.width;
    
    [super render];
    [self.shadow render];
}

-(void)draw:(GLKBaseEffect*)effect
{
    [self.shadow draw:effect];
    [super draw:effect];
}

@end
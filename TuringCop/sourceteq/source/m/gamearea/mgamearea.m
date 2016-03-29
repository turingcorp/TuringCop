#import "mgamearea.h"

@implementation mgamearea

-(instancetype)init:(UIImage*)image
{
    self = [super init];
    self.image = image;
    
    return self;
}

#pragma mark functionality

-(void)loadgraphics
{
    self.glkarea = [[garea alloc] init:self];
    self.image = nil;
}

#pragma mark public

-(void)loadarea
{
    CGFloat rawscreenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat rawscreenheight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenwidth_2;
    CGFloat screenheight_2;
    
    if(rawscreenwidth > rawscreenheight)
    {
        self.screenwidth = rawscreenwidth;
        self.screenheight = rawscreenheight;
    }
    else
    {
        self.screenwidth = rawscreenheight;
        self.screenheight = rawscreenwidth;
    }
    
    screenwidth_2 = self.screenwidth / 2;
    screenheight_2 = self.screenheight / 2;
    CGSize imagesize = self.image.size;
    self.width = imagesize.width;
    self.height = imagesize.height;
    
    CGFloat width_2 = self.width / 2;
    CGFloat height_2 = self.height / 2;
    self.x = self.centerx = width_2 - screenwidth_2;
    self.y = self.centery = height_2 - screenheight_2;
    self.minx = 0;
    self.miny = 0;
    self.maxx = self.width - self.screenwidth;
    self.maxy = self.height - self.screenheight;
    
    [self loadgraphics];
}

@end
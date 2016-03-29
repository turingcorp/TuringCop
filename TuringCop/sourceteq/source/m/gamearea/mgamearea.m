#import "mgamearea.h"

@implementation mgamearea

-(instancetype)init:(UIImage*)image
{
    self = [super init];
    self.image = image;
    
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
    CGSize imagesize = image.size;
    self.width = imagesize.width;
    self.height = imagesize.height;
    
    CGFloat width_2 = self.width / 2;
    CGFloat height_2 = self.height / 2;
    self.centerx = width_2 - screenwidth_2;
    self.centery = height_2 - screenheight_2;
    
    return self;
}

@end
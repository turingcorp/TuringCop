#import "mgamearea.h"

@implementation mgamearea

-(instancetype)init:(UIImage*)image
{
    self = [super init];
    self.image = image;
    
    CGSize imagesize = image.size;
    self.width = imagesize.width;
    self.height = imagesize.height;
    
    CGFloat width_2 = self.width / 2;
    CGFloat height_2 = self.height / 2;
    
    return self;
}

@end
#import "vcontactratecell.h"

@implementation vcontactratecell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[[UIImage imageNamed:@"star"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.image = image;
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-5)-[image]-(-5)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(-5)-[image]-(-5)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)hover:(BOOL)selected
{
    if(selected)
    {
        [self.image setTintColor:colormain];
    }
    else
    {
        [self.image setTintColor:colorsecond];
    }
}

@end
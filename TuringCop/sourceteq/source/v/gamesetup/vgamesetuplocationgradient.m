#import "vgamesetuplocationgradient.h"

static CGFloat const topcolorred = 1;
static CGFloat const topcolorgreen = 1;
static CGFloat const topcolorblue = 1;
static CGFloat const topcoloralpha = 0;
static CGFloat const bottomcolorred = 0;
static CGFloat const bottomcolorgreen = 0;
static CGFloat const bottomcolorblue = 0;
static CGFloat const bottomcoloralpha = 0.6;

@interface vgamesetuplocationgradient ()

@property(weak, nonatomic)CAGradientLayer *layer;

@end

@implementation vgamesetuplocationgradient

@dynamic layer;

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UIColor *colorTop = [UIColor colorWithRed:topcolorred green:topcolorgreen blue:topcolorblue alpha:topcoloralpha];
    UIColor *colorBottom = [UIColor colorWithRed:bottomcolorred green:bottomcolorgreen blue:bottomcolorblue alpha:bottomcoloralpha];
    NSArray *colors = @[(id)colorTop.CGColor, (id)colorBottom.CGColor];
    [self.layer setColors:colors];
    
    return self;
}

+(Class)layerClass
{
    return [CAGradientLayer class];
}

@end
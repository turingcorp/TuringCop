#import "appdel.h"

@class garea;

@interface mgamearea:NSObject

-(instancetype)init:(UIImage*)image;
-(void)loadarea;

@property(strong, nonatomic)garea *glkarea;
@property(strong, nonatomic)UIImage *image;
@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat centerx;
@property(nonatomic)CGFloat centery;
@property(nonatomic)CGFloat screenwidth;
@property(nonatomic)CGFloat screenheight;

@end
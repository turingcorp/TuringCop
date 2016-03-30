#import <UIKit/UIKit.h>
#import "gimage.h"

@interface gspatial:NSObject

-(void)render;
-(void)draw:(GLKBaseEffect*)effect;
-(void)screenmovedx:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gimage *image;
@property(nonatomic)GLKVector2 *pointerposition;
@property(nonatomic)GLKVector2 *pointertexture;
@property(nonatomic)GLKVector4 color;
@property(nonatomic)GLsizei size;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;
@property(nonatomic)CGFloat visualy;

@end
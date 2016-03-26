#import "gspatial.h"

@interface gspatial ()

@property(strong, nonatomic)NSMutableData *dataposition;
@property(strong, nonatomic)NSMutableData *datatexture;

@end

@implementation gspatial

-(instancetype)init
{
    self = [super init];
    
    self.datatexture = [NSMutableData dataWithLength:6 * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, 1);
    self.pointertexture[2] = GLKVector2Make(1, 1);
    self.pointertexture[3] = GLKVector2Make(1, 1);
    self.pointertexture[4] = GLKVector2Make(1, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark functionality

-(void)vectorx:(CGFloat)x y:(CGFloat)y
{
    [self.dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[self.size] = GLKVector2Make(x, y);
    self.size++;
}

#pragma mark public

-(void)render
{
    self.size = 0;
    self.dataposition = [NSMutableData data];
    
    CGFloat minx = self.x;
    CGFloat maxx = minx + self.width;
    CGFloat miny = self.y;
    CGFloat maxy = miny + self.height;
    
    [self vectorx:minx y:miny];
    [self vectorx:minx y:maxy];
    [self vectorx:maxx y:maxy];
    [self vectorx:maxx y:maxy];
    [self vectorx:maxx y:miny];
    [self vectorx:minx y:miny];
}

@end

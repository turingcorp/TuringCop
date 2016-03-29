#import "gimage.h"
#import "nsnotification+nsnotificationmain.h"

@implementation gimage
{
    CGFloat counter;
    NSUInteger speedcounter;
    NSUInteger currentindex;
}

-(instancetype)init
{
    self = [super init];
    self.speed = 30;
    self.textures = [NSMutableArray array];
    self.random = NO;
    self.srgb = NO;
    speedcounter = 0;
    
    return self;
}

-(void)dealloc
{
    for(NSInteger i = counter - 1; i >= 0; i--)
    {
        GLuint current = [self.textures[i] unsignedIntValue];
        [self.textures removeObjectAtIndex:i];
        glDeleteTextures(1, &current);
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter >= self.speed)
    {
        speedcounter = 0;
        [self nextimage];
    }
}

#pragma mark functionality

-(void)loadcurrent
{
    NSNumber *nextnumber = self.textures[currentindex];
    self.current = nextnumber.unsignedIntValue;
}

-(void)nextimage
{
    if(self.random)
    {
        currentindex = arc4random_uniform(counter);
    }
    else
    {
        currentindex++;
        
        if(currentindex >= counter)
        {
            currentindex = 0;
        }
    }
    
    [self loadcurrent];
}

-(void)addimage:(UIImage*)image
{
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(self.srgb)} error:nil];
    GLuint texture = textureinfo.name;
    [self.textures addObject:@(texture)];
}

#pragma mark public

-(void)loadtextures:(NSArray<NSString*>*)textures
{
    counter = textures.count;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       for(NSInteger i = 0; i < counter; i++)
                       {
                           NSString *texturename = textures[i];
                           UIImage *image = [UIImage imageNamed:texturename];
                           [self addimage:image];
                       }
                       
                       [self nextimage];
                       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
                   });
}

-(void)loadtextureimage:(UIImage*)image
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self addimage:image];
                       self.current = 0;
                       [self loadcurrent];
                   });
}

@end
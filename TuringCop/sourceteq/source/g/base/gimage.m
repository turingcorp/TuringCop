#import "gimage.h"

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
    speedcounter = 0;
    
#warning "add animation, add notification move"
    
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

#pragma mark public

-(void)loadtextures:(NSArray<NSString*>*)textures
{
    counter = textures.count;
    
    if(counter == 1)
    {
        self.random = NO;
    }
    else
    {
        self.random = YES;
    }
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       for(NSInteger i = 0; i < counter; i++)
                       {
                           NSString *texturename = textures[i];
                           UIImage *image = [UIImage imageNamed:texturename];
                           GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:nil error:nil];
                           GLuint texture = textureinfo.name;
                           [self.textures addObject:@(texture)];
                       }
                       
                       [self nextimage];
                   });
}

-(void)loadtextureimage:(UIImage*)image
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:nil error:nil];
                       GLuint texture = textureinfo.name;
                       self.current = 0;
                       [self.textures addObject:@(texture)];
                       [self loadcurrent];
                   });
}

@end
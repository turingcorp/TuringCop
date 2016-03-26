#import "gimage.h"

@implementation gimage
{
    CGFloat counter;
    NSUInteger speedcounter;
    NSUInteger currentindex;
}

-(instancetype)init:(NSArray<NSString*>*)textures
{
    self = [super init];
    self.speed = 30;
    speedcounter = 0;
    counter = textures.count;
    
    if(counter == 1)
    {
        self.random = NO;
    }
    else
    {
        self.random = YES;
    }
    
    [self loadtextures:textures];
    
#warning "add animation, add notification move"
    
    return self;
}

#pragma mark functionality

-(void)loadtextures:(NSArray<NSString*>*)textures
{
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
    
    NSNumber *nextnumber = self.textures[currentindex];
    self.current = nextnumber.unsignedIntegerValue;
}

@end
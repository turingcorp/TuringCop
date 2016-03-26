#import "ctoast.h"

@implementation ctoast

+(void)toast:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       ctoast *controller = [[ctoast alloc] init:message];
                       [[cmain singleton] presentViewController:controller animated:NO completion:nil];
                   });
}

-(instancetype)init:(NSString*)message
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.message = message;
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vtoast alloc] init:self];
}

#pragma mark public

-(void)dismiss
{
    [[cmain singleton] dismissViewControllerAnimated:NO completion:nil];
}

@end
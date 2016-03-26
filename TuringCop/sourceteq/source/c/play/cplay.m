#import "cplay.h"

@implementation cplay

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.chapter = chapter;
    self.scoreready = NO;
    self.keepplaying = YES;
    [self next:NO];
    
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

#pragma mark functionality

-(void)next:(BOOL)animated
{
    mchallenge *challenge = [self.chapter challenge];
    cplayitem *controller = [[cplayitem alloc] init:self challenge:challenge];
    
    [self setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionForward animated:animated completion:nil];
}

-(void)finish
{
    cplayfinish *controller = [[cplayfinish alloc] init:self];
    
    [self setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark functionality

-(void)save
{
    [self.chapter save];
    
    self.scoreready = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:notscoreready object:nil];
}

#pragma mark public

-(void)playnext:(NSUInteger)currentindex
{
    self.keepplaying = currentindex < self.chapter.totalchallenges;
    
    if(self.keepplaying)
    {
        [self next:YES];
    }
    else
    {
        [self finish];
    }
}

-(void)scorecomputed
{
    if(!self.keepplaying)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           [self save];
                       });
    }
}

@end
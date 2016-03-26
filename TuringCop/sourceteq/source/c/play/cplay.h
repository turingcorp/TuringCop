#import "appdel.h"

@class mcourseitemchapter;

@interface cplay:UIPageViewController

-(instancetype)init:(mcourseitemchapter*)chapter;
-(void)playnext:(NSUInteger)currentindex;
-(void)scorecomputed;

@property(weak, nonatomic)mcourseitemchapter *chapter;
@property(nonatomic)BOOL scoreready;
@property(nonatomic)BOOL keepplaying;

@end
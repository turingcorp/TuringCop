#import "vstatus.h"

@implementation vstatus

-(instancetype)init:(cstatus*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor blackColor]];
    
    UICollectionView *collection = [[UICollectionView alloc] init];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setAlwaysBounceVertical:YES];
    self.collection = collection;

    vstatusbar *statusbar = [[vstatusbar alloc] init];
    self.statusbar = statusbar;
    
    [self addSubview:collection];
    
    return self;
}

@end
#import "vstatus.h"

@implementation vstatus

-(instancetype)init:(cstatus*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor blackColor]];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setAlwaysBounceVertical:YES];
    self.collection = collection;

    vstatusbar *statusbar = [[vstatusbar alloc] init:controller];
    self.statusbar = statusbar;
    
    [self addSubview:collection];
    [self addSubview:statusbar];
    
    NSDictionary *views = @{@"bar":statusbar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(120)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end
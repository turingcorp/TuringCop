#import "mbuilding.h"

@implementation mbuilding

-(instancetype)init
{
    self = [super init];
    self.glkbuilding = [[gbuilding alloc] init:self];
    self.items = [NSMutableArray array];
    self.rawbuldings = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"buildings" withExtension:@"plist"]];
    
    return self;
}

#pragma mark public

-(void)addbuildingatx:(CGFloat)x y:(CGFloat)y
{
    NSUInteger index = arc4random_uniform((CGFloat)self.rawbuldings.count);
    NSDictionary *rawbuilding = self.rawbuldings[index];
    mbuildingitem *building = [[mbuildingitem alloc] init:rawbuilding x:x y:y];
    
    [self.items addObject:building];
}

@end
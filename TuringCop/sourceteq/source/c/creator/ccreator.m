#import "ccreator.h"

@implementation ccreator

-(instancetype)init:(cpages*)pages
{
    self = [super init];
    
    self.pages = pages;
    
    return self;
}

@end
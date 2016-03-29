#import "vgameloader.h"

static NSUInteger const spinnerheight = 50;

@interface vgameloader ()

@property(weak, nonatomic)cgameloader *controller;

@end

@implementation vgameloader

@dynamic controller;

-(instancetype)init:(cgameloader*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *title = [[UILabel alloc] init];
    [title setTextColor:[UIColor main]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont regularsize:18]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:NSLocalizedString(@"game_loader_title", nil)];
 
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:title];
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner, @"title":title};
    NSDictionary *metrics = @{@"spinnerheight":@(spinnerheight)};
    
    self.layoutspinnertop = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinner(spinnerheight)]-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutspinnertop];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat height = self.bounds.size.height;
    CGFloat margin = (height - spinnerheight) / 2.0;
    
    self.layoutspinnertop.constant = margin;
    [super layoutSubviews];
}

-(void)dealloc
{
    [self.spinner stopAnimating];
}

@end
#import "vstorebar.h"

@implementation vstorebar

-(instancetype)init:(cstore*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor second]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonrestore = [[UIButton alloc] init];
    [buttonrestore setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonrestore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonrestore setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonrestore setTitle:NSLocalizedString(@"store_restore", nil) forState:UIControlStateNormal];
    [buttonrestore.titleLabel setFont:[UIFont boldsize:18]];
    [buttonrestore addTarget:self action:@selector(actionrestore:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonrestore = buttonrestore;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont regularsize:18]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:NSLocalizedString(@"store_title", nil)];
    
    [self addSubview:label];
    [self addSubview:buttonback];
    [self addSubview:buttonrestore];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label, @"buttonrestore":buttonrestore};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonback(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonrestore(110)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonrestore(50)]" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedstorereloaded:) name:notification_purchaseupd object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedstorereloaded:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.buttonrestore setUserInteractionEnabled:YES];
                   });
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actionrestore:(UIButton*)button
{
    [button setUserInteractionEnabled:NO];
    [self.controller.model restorepurchases];
    
    [valert alert:NSLocalizedString(@"store_restoring", nil) inview:self.superview offsettop:65];
}

@end
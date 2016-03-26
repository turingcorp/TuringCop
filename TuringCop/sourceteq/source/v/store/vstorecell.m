#import "vstorecell.h"

static NSUInteger const labelmarginleft = 20;
static NSUInteger const labelmarginright = 20;

@implementation vstorecell
{
    CGFloat marginleftright;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    marginleftright = labelmarginleft + labelmarginright;
 
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    UILabel *statuslabel = [[UILabel alloc] init];
    [statuslabel setBackgroundColor:[UIColor clearColor]];
    [statuslabel setUserInteractionEnabled:NO];
    [statuslabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [statuslabel setFont:[UIFont fontWithName:fontregularname size:17]];
    [statuslabel setTextColor:colormain];
    self.statuslabel = statuslabel;
    
    UIImageView *statusicon = [[UIImageView alloc] init];
    [statusicon setClipsToBounds:YES];
    [statusicon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [statusicon setContentMode:UIViewContentModeScaleAspectFit];
    [statusicon setUserInteractionEnabled:NO];
    [statusicon setImage:[UIImage imageNamed:@"success"]];
    self.statusicon = statusicon;
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colormain];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.layer setCornerRadius:4];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"purchase_button_purchase", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionpurchase:) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.spinner = spinner;
    
    [self addSubview:label];
    [self addSubview:statuslabel];
    [self addSubview:statusicon];
    [self addSubview:button];
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"label":label, @"statuslabel":statuslabel, @"statusicon":statusicon, @"button":button, @"spinner":spinner};
    NSDictionary *metrics = @{@"labelmarginleft":@(labelmarginleft), @"labelmarginright":@(labelmarginright)};
    
    self.layoutlabelheight = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(labelmarginleft)-[label]-(labelmarginright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(38)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[statuslabel]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[statusicon(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[statusicon(30)]-(20)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[button(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[statuslabel]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinner]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelheight];
    
    return self;
}

#pragma mark actions

-(void)actionpurchase:(UIButton*)button
{
    [self.button setHidden:YES];
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
    [self.item purchase];
}

#pragma mark public

-(void)config:(mstorepurchasesitem*)item
{
    [self.spinner setHidden:YES];
    self.item = item;
    
    if(item.skproduct)
    {
        CGFloat width = self.bounds.size.width;
        CGFloat labelwidth = width - marginleftright;
        CGFloat labelheight = ceilf([item.attributestring boundingRectWithSize:CGSizeMake(labelwidth, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
        
        self.layoutlabelheight.constant = labelheight;
        [self.label setAttributedText:item.attributestring];
    }
}

@end
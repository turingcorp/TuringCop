#import "vcontactemail.h"

static NSString* const mailurl = @"mailto:gauss@iturbi.de";

@implementation vcontactemail

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:21], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSDictionary *dictsubtitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.6]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"contact_email_title", nil) attributes:dicttitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"contact_email_subtitle", nil) attributes:dictsubtitle];
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] init];
    [mutable appendAttributedString:attrtitle];
    [mutable appendAttributedString:attrsubtitle];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setAttributedText:mutable];
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colormain];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"contact_email_button", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button.layer setCornerRadius:4];
    [button addTarget:self action:@selector(actionsendemail:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label(90)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(120)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(40)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsendemail:(UIButton*)button
{
    [[analytics singleton] trackevent:ga_event_email action:ga_action_optin label:nil];
    
    NSURL *url = [NSURL URLWithString:mailurl];
    [[UIApplication sharedApplication] openURL:url];
}

@end
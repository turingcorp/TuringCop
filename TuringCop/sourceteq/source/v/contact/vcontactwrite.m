#import "vcontactwrite.h"

@implementation vcontactwrite

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    UIFont *font = [UIFont fontWithName:fontregularname size:20];
    UIColor *textcolor = [UIColor colorWithWhite:0.2 alpha:1];
    UIColor *basecolor = [colorsecond colorWithAlphaComponent:0.4];
    
    UILabel *labelgeneraltitle = [[UILabel alloc] init];
    [labelgeneraltitle setBackgroundColor:[UIColor clearColor]];
    [labelgeneraltitle setUserInteractionEnabled:NO];
    [labelgeneraltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelgeneraltitle setFont:[UIFont fontWithName:fontregularname size:22]];
    [labelgeneraltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [labelgeneraltitle setText:NSLocalizedString(@"contact_write_generaltitle", nil)];
    
    UILabel *labelnametitle = [[UILabel alloc] init];
    [labelnametitle setBackgroundColor:[UIColor clearColor]];
    [labelnametitle setUserInteractionEnabled:NO];
    [labelnametitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelnametitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelnametitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelnametitle setText:NSLocalizedString(@"contact_write_nametitle", nil)];
    
    UILabel *labelemailtitle = [[UILabel alloc] init];
    [labelemailtitle setBackgroundColor:[UIColor clearColor]];
    [labelemailtitle setUserInteractionEnabled:NO];
    [labelemailtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelemailtitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelemailtitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelemailtitle setText:NSLocalizedString(@"contact_write_emailtitle", nil)];
    
    UILabel *labelmessagetitle = [[UILabel alloc] init];
    [labelmessagetitle setBackgroundColor:[UIColor clearColor]];
    [labelmessagetitle setUserInteractionEnabled:NO];
    [labelmessagetitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelmessagetitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelmessagetitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelmessagetitle setText:NSLocalizedString(@"contact_write_messagetitle", nil)];
    
    UIView *fieldnamebase = [[UIView alloc] init];
    [fieldnamebase setBackgroundColor:basecolor];
    [fieldnamebase setClipsToBounds:YES];
    [fieldnamebase.layer setCornerRadius:4];
    [fieldnamebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *fieldemailbase = [[UIView alloc] init];
    [fieldemailbase setBackgroundColor:basecolor];
    [fieldemailbase setClipsToBounds:YES];
    [fieldemailbase.layer setCornerRadius:4];
    [fieldemailbase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *areamessagebase = [[UIView alloc] init];
    [areamessagebase setBackgroundColor:basecolor];
    [areamessagebase setClipsToBounds:YES];
    [areamessagebase.layer setCornerRadius:4];
    [areamessagebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UITextField *fieldname = [[UITextField alloc] init];
    [fieldname setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [fieldname setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldname setBackgroundColor:[UIColor clearColor]];
    [fieldname setBorderStyle:UITextBorderStyleNone];
    [fieldname setClearButtonMode:UITextFieldViewModeNever];
    [fieldname setDelegate:self];
    [fieldname setFont:font];
    [fieldname setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldname setKeyboardType:UIKeyboardTypeAlphabet];
    [fieldname setReturnKeyType:UIReturnKeyNext];
    [fieldname setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldname setTextColor:textcolor];
    [fieldname setTintColor:textcolor];
    [fieldname setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldname = fieldname;
    
    UITextField *fieldemail = [[UITextField alloc] init];
    [fieldemail setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [fieldemail setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldemail setBackgroundColor:[UIColor clearColor]];
    [fieldemail setBorderStyle:UITextBorderStyleNone];
    [fieldemail setClearButtonMode:UITextFieldViewModeNever];
    [fieldemail setDelegate:self];
    [fieldemail setFont:font];
    [fieldemail setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldemail setKeyboardType:UIKeyboardTypeAlphabet];
    [fieldemail setReturnKeyType:UIReturnKeyNext];
    [fieldemail setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldemail setTextColor:textcolor];
    [fieldemail setTintColor:textcolor];
    [fieldemail setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldemail = fieldemail;
    
    UITextView *messageview = [[UITextView alloc] init];
    [messageview setAutocapitalizationType:UITextAutocapitalizationTypeSentences];
    [messageview setAutocorrectionType:UITextAutocorrectionTypeNo];
    [messageview setBackgroundColor:[UIColor clearColor]];
    [messageview setFont:font];
    [messageview setIndicatorStyle:UIScrollViewIndicatorStyleBlack];
    [messageview setKeyboardAppearance:UIKeyboardAppearanceLight];
    [messageview setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [messageview setKeyboardType:UIKeyboardTypeAlphabet];
    [messageview setReturnKeyType:UIReturnKeyDone];
    [messageview setShowsHorizontalScrollIndicator:NO];
    [messageview setSpellCheckingType:UITextSpellCheckingTypeNo];
    [messageview setTextColor:textcolor];
    [messageview setTintColor:textcolor];
    [messageview setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.messageview = messageview;
    
    UIButton *buttonsend = [[UIButton alloc] init];
    [buttonsend setBackgroundColor:colormain];
    [buttonsend setClipsToBounds:YES];
    [buttonsend setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonsend.layer setCornerRadius:4];
    [buttonsend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsend setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonsend.titleLabel setFont:[UIFont fontWithName:fontregularname size:17]];
    [buttonsend setTitle:NSLocalizedString(@"contact_write_buttonsend", nil) forState:UIControlStateNormal];
    [buttonsend addTarget:self action:@selector(actionsendmessage:) forControlEvents:UIControlEventTouchUpInside];
    
    [fieldnamebase addSubview:fieldname];
    [fieldemailbase addSubview:fieldemail];
    [areamessagebase addSubview:messageview];
    [self addSubview:labelgeneraltitle];
    [self addSubview:labelnametitle];
    [self addSubview:labelemailtitle];
    [self addSubview:labelmessagetitle];
    [self addSubview:fieldnamebase];
    [self addSubview:fieldemailbase];
    [self addSubview:areamessagebase];
    [self addSubview:buttonsend];
    
    NSDictionary *views = @{@"labelgeneral":labelgeneraltitle, @"fieldname":fieldname, @"namebase":fieldnamebase, @"labelname":labelnametitle, @"labelemail":labelemailtitle, @"emailbase":fieldemailbase, @"fieldemail":fieldemail, @"labelmessage":labelmessagetitle, @"messagebase":areamessagebase, @"messageview":messageview, @"buttonsend":buttonsend};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelgeneral]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelname]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelemail]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelmessage]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[namebase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[emailbase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[messagebase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[fieldname]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[fieldname]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[fieldemail]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[fieldemail]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[messageview]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[messageview]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonsend(120)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[labelgeneral]-20-[labelname]-10-[namebase(50)]-50-[labelemail]-10-[emailbase(50)]-50-[labelmessage]-10-[messagebase]-50-[buttonsend(40)]-40-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsendmessage:(UIButton*)buttonsend
{
    [self sendmessage];
}

#pragma mark functionality

-(void)sendmessage
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    NSString *namestring = self.fieldname.text;
    NSString *emailstring = self.fieldemail.text;
    NSString *messagestring = self.messageview.text;
    NSString *alertmsg;
    
    if(messagestring.length > 2)
    {
        NSMutableString *string = [NSMutableString string];
        
        if(namestring)
        {
            [string appendFormat:@"Name: %@;", namestring];
        }
        
        if(emailstring)
        {
            [string appendFormat:@"Email: %@;", emailstring];
        }
        
        [string appendFormat:@"Message:%@", messagestring];
        
        [[analytics singleton] trackevent:ga_event_message action:ga_action_optin label:string];
        
        [self.fieldname setText:@""];
        [self.fieldemail setText:@""];
        [self.messageview setText:@""];
        
        alertmsg = NSLocalizedString(@"contact_write_messagesent", nil);
    }
    else
    {
        alertmsg = NSLocalizedString(@"contact_write_emptymessage", nil);
    }
    
    [valert alert:alertmsg inview:self.viewcontact offsettop:0];
}

#pragma mark -
#pragma mark text field del

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    if(field == self.fieldname)
    {
        [self.fieldemail becomeFirstResponder];
    }
    else
    {
        [self.messageview becomeFirstResponder];
    }
    
    return YES;
}

@end
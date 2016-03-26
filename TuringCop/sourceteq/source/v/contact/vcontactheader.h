#import "appdel.h"

@class ccontact;

@interface vcontactheader:UIView

-(instancetype)init:(ccontact*)controller;

@property(weak, nonatomic)ccontact *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutfireheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutrocketbottom;
@property(weak, nonatomic)UIImageView *imagefire;
@property(nonatomic)NSUInteger fireinitialheight;

@end
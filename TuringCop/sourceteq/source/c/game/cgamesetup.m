#import "cgamesetup.h"

static NSString* const searchquery = @"";
static CGFloat const mapspanradius = 0.001;
static CGFloat const searchspanradius = 0.005;
static NSUInteger const mapwidth = 1600;
static NSUInteger const mapheight = 1200;

@interface cgamesetup ()

@property(strong, nonatomic)vgamesetup *view;

@end

@implementation cgamesetup

@dynamic view;

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!self.model)
    {
        [self locationcheck];
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)loadView
{
    self.view = [[vgamesetup alloc] init:self];
}

#pragma mark functionality

-(void)locationcheck
{
    switch([CLLocationManager authorizationStatus])
    {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            
            [self locationstart];
            [self.locationmanager startUpdatingLocation];
            
            break;
            
        case kCLAuthorizationStatusNotDetermined:
            
            [self locationstart];
            [self locationrequest];
            
            break;
            
        case kCLAuthorizationStatusDenied:
            
            [self usedefaultlocation];
            
            break;
        case kCLAuthorizationStatusRestricted:
            break;
    }
}

-(void)locationstart
{
    self.locationmanager = [[CLLocationManager alloc] init];
    [self.locationmanager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationmanager setDistanceFilter:1];
    [self.locationmanager setDelegate:self];
}

-(void)locationrequest
{
    if([self.locationmanager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationmanager requestWhenInUseAuthorization];
    }
    else
    {
        [self.locationmanager startUpdatingLocation];
    }
}

-(void)usedefaultlocation
{
#warning "implement default location"
}

-(void)maponvenue:(MKMapItem*)venue
{
    __weak typeof(self) weakself = self;
    
    CLLocationCoordinate2D location = venue.placemark.location.coordinate;
    MKCoordinateSpan mapspan = MKCoordinateSpanMake(mapspanradius, mapspanradius);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, mapspan);
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.region = region;
    options.size = CGSizeMake(mapwidth, mapheight);
    options.showsBuildings = NO;
    options.showsPointsOfInterest = NO;
    options.mapType = MKMapTypeStandard;
    
    MKMapSnapshotter *snapper = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapper startWithQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) completionHandler:
     ^(MKMapSnapshot *_Nullable snapshot, NSError *_Nullable error)
     {
         if(error)
         {
             [valert alert:error.localizedDescription];
         }
         else
         {
             UIImage *rawimage = snapshot.image;
             weakself.model = [[mgamearea alloc] init:rawimage];
             
             dispatch_async(dispatch_get_main_queue(),
                            ^
                            {
                                
                            });
         }
     }];
}

-(void)venueinlocation:(CLLocationCoordinate2D)coordinates
{
    __weak typeof(self) weakself = self;
    
    MKCoordinateSpan searchspan = MKCoordinateSpanMake(searchspanradius, searchspanradius);
    MKCoordinateRegion searchregion = MKCoordinateRegionMake(coordinates, searchspan);
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = searchregion;
    request.naturalLanguageQuery = searchquery;
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:
     ^(MKLocalSearchResponse *_Nullable response, NSError *_Nullable error)
     {
         if(error)
         {
             [valert alert:error.localizedDescription];
         }
         else
         {
             NSArray<MKMapItem*> *venues = response.mapItems;
             NSUInteger count = venues.count;
             
             if(count)
             {
#warning "no venue found"
             }
             else
             {
                 NSUInteger venueindex = arc4random_uniform((CGFloat)count);
                 MKMapItem *venue = venues[venueindex];
                 [weakself maponvenue:venue];
             }
         }
     }];
}

#pragma mark public

-(void)startgame
{
//    [[cmain singleton].pages sectiongameload:[self.view.model modelarea]];
}

-(void)cancelgame
{
    [self.locationmanager stopUpdatingLocation];
    [[cmain singleton].pages sectionhome:YES direction:UIPageViewControllerNavigationDirectionReverse];
}

#pragma mark -
#pragma mark location del

-(void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationmanager startUpdatingLocation];
    }
    else
    {
        [self usedefaultlocation];
    }
}

-(void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray<CLLocation*>*)locations
{
    if(locations.count)
    {
        [manager stopUpdatingLocation];
        [manager setDelegate:nil];
        
        CLLocation *location = locations[0];
        [self venueinlocation:location.coordinate];
    }
}

@end
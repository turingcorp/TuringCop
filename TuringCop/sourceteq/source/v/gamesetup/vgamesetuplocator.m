#import "vgamesetuplocator.h"

static NSString* const searchquery = @"";
static CGFloat const mapspanradius = 0.001;
static CGFloat const searchspanradius = 0.005;
static NSUInteger const mapwidth = 1600;
static NSUInteger const mapheight = 1200;

@implementation vgamesetuplocator

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self locationcheck];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
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
             dispatch_async(dispatch_get_main_queue(),
                            ^
                            {
                                UIImage *rawimage = snapshot.image;
                                UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
                                [image setImage:rawimage];
                                [image setClipsToBounds:YES];
                                [image setContentMode:UIViewContentModeCenter];
                                
                                [self addSubview:image];
                                self.gamearea = [[mgamearea alloc] init:rawimage];
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
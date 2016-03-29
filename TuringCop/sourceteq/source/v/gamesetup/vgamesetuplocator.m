#import "vgamesetuplocator.h"

static CGFloat const mapspanradius = 0.002;

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

-(void)mapfor:(CLLocationCoordinate2D)coordinates
{
    MKCoordinateSpan mapspan = MKCoordinateSpanMake(mapspanradius, mapspanradius);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinates, mapspan);
    
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.region = region;
    options.size = CGSizeMake(2000, 2000);
    options.showsBuildings = NO;
    options.showsPointsOfInterest = NO;
    options.mapType = MKMapTypeStandard;
    
    /*
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = region;
    request.naturalLanguageQuery = @"mall";
    request.naturalLanguageQuery = @"museum";
    
    search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:
     ^(MKLocalSearchResponse * _Nullable _response, NSError * _Nullable _error)
     {
         if(_error)
         {
             NSLog(@"error %@", _error.localizedDescription);
         }
         else
         {
             NSArray<MKMapItem*> *items = _response.mapItems;
             NSInteger count = items.count;
             
             for(NSInteger i = 0; i < count; i++)
             {
                 MKMapItem *item = items[i];
                 NSLog(@"%@", item.name);
             }
         }
     }];*/
    
    MKMapSnapshotter *snapper = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapper startWithQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) completionHandler:
     ^(MKMapSnapshot * _Nullable snapshot, NSError * _Nullable error)
    {
        if(error)
        {
            NSLog(@"%@", error);
        }
        else
        {
//            UIImage *image = snapshot.image;
//            NSData *data = UIImagePNGRepresentation(image);
//            [data writeToFile:[self snapshotFilename] atomically:YES];
            
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
        [self mapfor:location.coordinate];
    }
}

@end
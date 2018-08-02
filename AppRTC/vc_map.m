//
//  vc_map.m
//  AppRTC
//
//  Created by adib almaraabeh on 02/08/2018.
//  Copyright © 2018 ISBX. All rights reserved.
//

#import "vc_map.h"
@import GooglePlaces;
@interface vc_map ()

@end

@implementation vc_map
{
     GMSPlacesClient *_placesClient;
    CLLocationManager *LocationManager;
    NSMutableArray *Locations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    @try
    {
        LocationManager = [[CLLocationManager alloc] init];
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        LocationManager.delegate = self;
        [LocationManager requestWhenInUseAuthorization];
        [LocationManager startUpdatingLocation];
        
        
        Locations = [[NSMutableArray alloc]init];
        
        NSMutableDictionary *firstDic = [[NSMutableDictionary alloc]init];
        
        [firstDic setObject:[NSNumber numberWithDouble:21.520636] forKey:@"lat"];
       
        [firstDic setObject: [NSNumber numberWithDouble:39.191044] forKey:@"lang"];
        [firstDic setObject:@"bokhsh hospital" forKey:@"Title"];
        
        NSMutableDictionary *firstDic2 = [[NSMutableDictionary alloc]init];
        
        
        [firstDic2 setObject:[NSNumber numberWithDouble:21.597646] forKey:@"lat"];
        
        [firstDic2 setObject:[NSNumber numberWithDouble:39.133086] forKey:@"lang"];
        [firstDic2 setObject:@"saudi german hospital" forKey:@"Title"];
        
        NSMutableDictionary *firstDic3 = [[NSMutableDictionary alloc]init];
        
        [firstDic3 setObject:[NSNumber numberWithDouble:21.595424] forKey:@"lat"];
        
        [firstDic3 setObject:[NSNumber numberWithDouble:39.143690] forKey:@"lang"];
        [firstDic3 setObject:@"Dental Hospital" forKey:@"Title"];
        
        
        Locations = [[NSMutableArray alloc]initWithObjects:firstDic,firstDic2,firstDic3, nil];
        
    
    }
    @catch(NSException *Ex)
    {
        NSLog(@"you have error in function view did load %@",Ex.description);
    }
}


-(void)viewDidAppear:(BOOL)animated{
 
    [LocationManager requestWhenInUseAuthorization];
    if ([LocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [LocationManager requestWhenInUseAuthorization];
    }
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude=LocationManager.location.coordinate.latitude;
    coordinate.longitude=LocationManager.location.coordinate.longitude;
    //CLLocationCoordinate2D  ctrpoint;
    //  ctrpoint.latitude = ;
    //ctrpoint.longitude =f1;
    //coordinate.latitude=23.6999;
    //coordinate.longitude=75.000;
    MKPointAnnotation *marker = [MKPointAnnotation new];
    marker.coordinate = coordinate;
    NSLog(@"%f",coordinate.latitude);
    //[self.mapView addAnnotation:marker];
    
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude
                       ];
    
    _placesClient = [GMSPlacesClient sharedClient];
    [self loadPlaces];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadPlaces
{
    /*
    [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList *placeLikelihoodList, NSError *error){
        if (error != nil) {
            NSLog(@"Pick Place error %@", [error localizedDescription]);
            return;
        }
        
       
        if (placeLikelihoodList != nil) {
            GMSPlace *place = [[[placeLikelihoodList likelihoods] firstObject] place];
            if (place != nil) {
                
                
     
                
                
            }
        }
    }];
    
    */
    

    
    @try
    {
        for (int i = 0 ; i < Locations.count; i++) {
            
            NSMutableDictionary *dic = [Locations objectAtIndex:i];
            CLLocationCoordinate2D cor;
            cor.latitude = [[dic objectForKey:@"lat"]doubleValue];
            cor.longitude = [[dic objectForKey:@"lang"]doubleValue];
            
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cor, 800, 800);
            [self.hospitalMap setRegion:[self.hospitalMap regionThatFits:region] animated:YES];
            
            // Add an annotation
            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
            point.coordinate = cor;
            point.title = [dic valueForKey:@"Title"];
            point.subtitle = [dic valueForKey:@"Title"];
            
            [self.hospitalMap addAnnotation:point];
            
        }
    }
    @catch(NSException *ex)
    {
        NSLog(@"you have error in function loadPlaces");
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
   
}


- (IBAction)btnDismiss:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  vc_map.h
//  AppRTC
//
//  Created by adib almaraabeh on 02/08/2018.
//  Copyright © 2018 ISBX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface vc_map : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *hospitalMap;
- (IBAction)btnDismiss:(UIBarButtonItem *)sender;

@end

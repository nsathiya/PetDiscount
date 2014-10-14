//
//  Locater.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/12/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "Locater.h"


@implementation Locater

    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;

- (void) initLocater
{
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
   
}

- (void) startUpdating
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        _currentLatitude =  [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        _currentLongitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        
         NSLog(@"current Longitude: %@", _currentLongitude);
         NSLog(@"current latitude: %@", _currentLatitude);
        
    }
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            _curentAddress = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}

- (void)updatedisplay:(CCViewController *)vc
{
    
    NSLog(@"about to update display");
    vc.latitudeLabel.text = _currentLatitude;
    vc.LongitudeLabel.text = _currentLongitude;
    vc.addressLabel.text = _curentAddress;
    
    
    //[locationManager stopUpdatingLocation];
}



@end

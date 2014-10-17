//
//  Locater.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/12/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CCViewController.h"

@interface Locater : NSObject  <CLLocationManagerDelegate>


- (void) initLocater;
- (void) startUpdating;
//- (void) updatedisplay:(CCViewController *)vc;
@property (strong, nonatomic) IBOutlet NSString *currentLatitude;
@property (strong, nonatomic) IBOutlet NSString *currentLongitude;
@property (strong, nonatomic) IBOutlet NSString *curentAddress;
@end

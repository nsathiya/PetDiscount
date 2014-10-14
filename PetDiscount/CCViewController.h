//
//  CCViewController.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/8/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCViewController : UIViewController
- (IBAction)getLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *LongitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

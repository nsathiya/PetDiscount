//
//  DealDetailViewController.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *dealImage;
@property (weak, nonatomic) IBOutlet UILabel *dealCompany;
@property (weak, nonatomic) IBOutlet UILabel *dealTitle;
@property (weak, nonatomic) IBOutlet UILabel *dealAddress;
@property (weak, nonatomic) IBOutlet UILabel *dealAfterDiscount;
@property (weak, nonatomic) IBOutlet UILabel *startValue;
@property (weak, nonatomic) IBOutlet UILabel *discountValue;
@property (weak, nonatomic) IBOutlet UILabel *saveValue;
@property (weak, nonatomic) IBOutlet UILabel *dealDescription;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (nonatomic, strong)NSArray *dealDetail;

@end

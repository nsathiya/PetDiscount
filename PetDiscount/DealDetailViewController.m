//
//  DealDetailViewController.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "DealDetailViewController.h"

@interface DealDetailViewController ()

@end

@implementation DealDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *deal = [self.dealDetail objectAtIndex:0];
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://app.petdiscounts.com/admin/%@",[deal objectForKey:@"image"]];
    //NSString *categoryUrl = [NSString stringWithFormat:@"http://app.petdiscounts.com/admin/%@",[deal objectForKey:@"category_marker"]];
    
    
    NSURL *imageURL = [NSURL URLWithString:imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    //NSURL *categoryURL = [NSURL URLWithString:categoryUrl];
    //NSData *categoryData = [NSData dataWithContentsOfURL:categoryURL];
    
    UIImage *dealImage = [UIImage imageWithData:imageData];
    NSString *afterValue = [NSString stringWithFormat:@"%@%@", @"$",[deal objectForKey:@"after_discount_value"]];
    NSString *beforeValue = [NSString stringWithFormat:@"%@%@", @"$",[deal objectForKey:@"start_value"]];
    NSString *saveValue = [NSString stringWithFormat:@"%@%@", @"$",[deal objectForKey:@"save_value"]];
    NSString *discount = [NSString stringWithFormat:@"%@%@",[deal objectForKey:@"discount"], @"%"];
    NSString *dealTitle = [deal objectForKey:@"title"];
    NSString *dealCompany = [deal objectForKey:@"company"];
    NSString *dealAddress = [deal objectForKey:@"address"];
    //UIImage *categoryMarker = [UIImage imageWithData:categoryData];
    NSString *endDate = [deal objectForKey:@"end_date"];
    NSString *startDate = [deal objectForKey:@"start_date"];
    NSString *dealDescription = [deal objectForKey:@"description"];
    
    
    _dealImage.image = dealImage;
    _dealAfterDiscount.text = afterValue;
    _startValue.text = beforeValue;
    _saveValue.text = saveValue;
    _discountValue.text = discount;
    _dealTitle.text = dealTitle;
    _dealCompany.text = dealCompany;
    _dealAddress.text = dealAddress;
    _endDate.text = endDate;
    _startDate.text = startDate;
    _dealDescription.text = dealDescription;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

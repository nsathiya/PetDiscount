//
//  DetailViewCell.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/22/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *afterValue;
@property (weak, nonatomic) IBOutlet UILabel *beforeValue;
@property (weak, nonatomic) IBOutlet UILabel *discountTitle;
@property (weak, nonatomic) IBOutlet UILabel *discountEnd;
@property (weak, nonatomic) IBOutlet UIImageView *discountMarker;
@property (weak, nonatomic) IBOutlet UIImageView *discountImage;

@end

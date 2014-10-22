//
//  DealListTableViewController.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewCell.h"
#import "ServerCalls.h"
#import "DealDetailViewController.h"

@interface DealListTableViewController : UITableViewController <ServerCallsDelegate>

@property (nonatomic, strong)NSArray *list;
@property (nonatomic, strong)NSArray *dealDetail;

@end

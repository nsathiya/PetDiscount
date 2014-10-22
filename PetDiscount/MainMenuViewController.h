//
//  MainMenuViewController.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerCalls.h"
#import "Locater.h"
#import "CategoryTableViewController.h"
#import "DealListTableViewController.h"
#import "AboutViewController.h"

@interface MainMenuViewController : UIViewController <ServerCallsDelegate>

- (IBAction)getCategories:(id)sender;
- (IBAction)goToSearch:(id)sender;
- (IBAction)getLatest:(id)sender;
- (IBAction)goToAbout:(id)sender;


@end

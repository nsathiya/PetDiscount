//
//  MainMenuViewController.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@property Locater *locater;
@property NSArray* list;

@end

@implementation MainMenuViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getLatest:(id)sender {
    ServerCalls *client = [[ServerCalls alloc] init];
    client.delegate = self;
    [client latest_deals:@"0" itemsPerPage:@"10"];
}

- (IBAction)goToAbout:(id)sender {
    [self performSegueWithIdentifier:@"getAbout" sender:nil];
}

- (IBAction)getCategories:(id)sender {
    ServerCalls *client = [[ServerCalls alloc] init];
    client.delegate = self;
    [client catogery_list];
}

-(void)client:(ServerCalls *)serverCalls sendWithData:(NSArray *)responseObject to:(NSString*)view {
    _list = responseObject;
    [self performSegueWithIdentifier:view sender:nil];
}

- (IBAction)goToSearch:(id)sender {
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue is %@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"getCategory"]) {
        
        CategoryTableViewController *CTVC = [segue destinationViewController];
        // Pass the information to your destination view
        [CTVC setList:_list];
    }
    if ([[segue identifier] isEqualToString:@"getLatestDeals"]) {
        
        DealListTableViewController *DLTVC = [segue destinationViewController];
        // Pass the information to your destination view
        [DLTVC setList:_list];
    
    }
    if ([[segue identifier] isEqualToString:@"getAbout"]) {
        
        AboutViewController *AVC = [segue destinationViewController];
        // Pass the information to your destination view
    }
}
@end

//
//  CCViewController.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/8/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "CCViewController.h"
#import "ServerCalls.h"
#import "Locater.h"
#import "CategoryTableViewController.h"


@interface CCViewController ()

@property Locater *locater;
@property NSArray* list;

@end

@implementation CCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _locater = [[Locater alloc] init];
    
    [_locater initLocater];
    NSLog(@"locater initialized");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CatogeriesClicked:(id)sender
{
    [ServerCalls catogery_list:^(NSArray* list){
        
        _list = list;
        NSLog(@"The array list count is %lu", (unsigned long)_list.count);
     
    }];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
       [self performSegueWithIdentifier:@"getCategory" sender:sender];
    });
    
    
    
}

- (IBAction)getLocation:(id)sender
{
    [_locater startUpdating];
    [_locater updatedisplay:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"getCategory"]) {
        
        CategoryTableViewController *vc = [segue destinationViewController];
        
         NSLog(@"Entering Segue");
        // Pass the information to your destination view
        [vc setList:_list];
    }
}
@end

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


@interface CCViewController ()

@property Locater *locater;

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
    
    NSArray *list = [ServerCalls catogery_list];
    NSLog(@"The array list count is %lu", (unsigned long)list.count);
}

- (IBAction)getLocation:(id)sender
{
    [_locater startUpdating];
    [_locater updatedisplay:self];
}
@end

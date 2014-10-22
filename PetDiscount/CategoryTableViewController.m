//
//  CategoryTableViewController.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/13/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "CatogeryCell.h"
#import "DealListTableViewController.h"

@interface CategoryTableViewController ()

@end

@implementation CategoryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"The array list count from table view is %lu", (unsigned long)_list.count);
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // Configure the cell...
    CatogeryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[CatogeryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    long row = [indexPath row];
    
    NSDictionary *catogery = [self.list objectAtIndex:row];
    //NSInteger category_id = [catogery objectForKey:@"category_id"];
    NSString *catogery_name = [catogery objectForKey:@"category_name"];
    NSString *url = [NSString stringWithFormat:@"http://app.petdiscounts.com/admin/%@",[catogery objectForKey:@"category_marker"]];
    
    
    NSURL *imageURL = [NSURL URLWithString:url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    NSLog(@"category row is %@", url);
    cell.categoryTitle.text = catogery_name;
    cell.categoryImage.image = image;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServerCalls *client = [[ServerCalls alloc] init];
    client.delegate = self;
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    long row = [myIndexPath row];
    
    NSDictionary *catogery = [self.list objectAtIndex:row];
    NSString *category_id = [catogery objectForKey:@"category_id"];
    [client deal_by_catogery:category_id startIndex:@"0" itemsPerPage:@"10"];

}

-(void)client:(ServerCalls *)serverCalls sendWithData:(NSArray *)responseObject to:(NSString*)view {
    _dealList = responseObject;
    [self performSegueWithIdentifier:view sender:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"getCategoryDeals"])
    {
        DealListTableViewController *DLTVC = [segue destinationViewController];
        
        [DLTVC setList:_dealList];
    }
}



@end

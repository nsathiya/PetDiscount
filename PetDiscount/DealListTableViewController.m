//
//  DealListTableViewController.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/17/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "DealListTableViewController.h"

@interface DealListTableViewController ()

@end

@implementation DealListTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DealCell";
    // Configure the cell...
    DetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[DetailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    long row = [indexPath row];
    
    NSDictionary *deal = [self.list objectAtIndex:row];
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://app.petdiscounts.com/admin/%@",[deal objectForKey:@"image"]];
    NSString *categoryUrl = [NSString stringWithFormat:@"http://app.petdiscounts.com/admin/%@",[deal objectForKey:@"category_marker"]];
    
    
    NSURL *imageURL = [NSURL URLWithString:imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    NSURL *categoryURL = [NSURL URLWithString:categoryUrl];
    NSData *categoryData = [NSData dataWithContentsOfURL:categoryURL];
    
    UIImage *dealImage = [UIImage imageWithData:imageData];
    NSString *afterValue = [deal objectForKey:@"after_discount_value"];
    NSString *beforeValue = [deal objectForKey:@"start_value"];
    NSString *dealTitle = [deal objectForKey:@"title"];
    UIImage *categoryMarker = [UIImage imageWithData:categoryData];
    NSString *endDate = [deal objectForKey:@"end_date"];
    
    cell.discountImage.image = dealImage;
    cell.discountMarker.image = categoryMarker;
    cell.discountTitle.text = dealTitle;
    cell.afterValue.text = afterValue;
    cell.beforeValue.text = beforeValue;
    cell.discountEnd.text = endDate;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServerCalls *client = [[ServerCalls alloc] init];
    client.delegate = self;
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    long row = [myIndexPath row];
    
    NSDictionary *deal = [self.list objectAtIndex:row];
    NSString *deal_id = [deal objectForKey:@"deal_id"];
    [client deal_detail:deal_id];
}

-(void)client:(ServerCalls *)serverCalls sendWithData:(NSArray *)responseObject to:(NSString*)view {
    _dealDetail = responseObject;
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
    
    if ([[segue identifier] isEqualToString:@"getDealDetail"])
    {
        DealDetailViewController *DDVC = [segue destinationViewController];
        
        [DDVC setDealDetail:self.dealDetail];
    }
}


@end

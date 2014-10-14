//
//  ServerCalls.m
//  PetDiscount
//
//  Created by Naren Sathiya on 10/8/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import "ServerCalls.h"

static NSString* const BaseURLString = @"http://app.petdiscounts.com/admin/";


@implementation ServerCalls

+ (NSArray *) catogery_list
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    //__block NSDictionary *json;
    //__block NSArray *catogeryList;
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];

    __block NSArray *cl;
    [manager GET:@"api/category_list?" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        
        //NSError *error;
         NSLog(@"before json dictionary");
        NSDictionary *json = (NSDictionary *)responseObject;
         NSLog(@"after json dictionary before arry");
        NSArray *catogeryList = [json objectForKey:@"categoryList"];
         //NSLog(@"after array selector");
        cl = catogeryList;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
         NSLog(@"Error: %@", error);
     }];
    
    return cl;
    
 }

+ (void) notify_new_deal
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    [manager GET:@"api/notify_new_deal?" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) latest_deals: (NSString*) start_index itemsPerPage:(NSString*) items_per_page
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"start_index"] = start_index;
    params[@"items_per_page"] = items_per_page;
    
    [manager GET:@"api/latest_deals?" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) deal_by_catogery:(NSString*) catogery_id startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"catogery_id"] = catogery_id;
    params[@"start_index"] = start_index;
    params[@"items_per_page"] = items_per_page;
    
    [manager GET:@"api/deal_by_catogery?" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) deal_detail: (NSString*) deal_id
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"deal_id"] = deal_id;
    
    [manager GET:@"api/deal_detail?" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) deal_by_search_name:(NSString*) keyword startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"keyword"] = keyword;
    params[@"start_index"] = start_index;
    params[@"items_per_page"] = items_per_page;
    
    [manager GET:@"api/deal_by_search_name?" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) deal_around_you:(NSString*) user_lat userLng:(NSString*) user_lng
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_lat"] = user_lat;
    params[@"user_lng"] = user_lng;
    
    [manager GET:@"api/deal_around_you?" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

+ (void) currency
{
    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    [manager GET:@"api/currency?" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}
@end

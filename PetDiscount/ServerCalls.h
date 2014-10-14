//
//  ServerCalls.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/8/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCalls : NSObject

+ (void) notify_new_deal;
+ (NSArray *) catogery_list;
+ (void) deal_detail: (NSString*) deal_id;
+ (void) latest_deals: (NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_by_catogery:(NSString*) catogery_id startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_by_search_name:(NSString*) keyword startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_around_you:(NSString*) user_lat userLng:(NSString*) user_lng;
+ (void) currency;



@end

//
//  ServerCalls.h
//  PetDiscount
//
//  Created by Naren Sathiya on 10/8/14.
//  Copyright (c) 2014 Naren Sathiya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ServerCalls;
@protocol ServerCallsDelegate

-(void) client:(ServerCalls *) serverCalls sendWithData:(NSArray*) responseObject to:(NSString*)view ;

@end


@interface ServerCalls : NSObject

@property (nonatomic, assign)id delegate;

+ (void) notify_new_deal;
- (void) catogery_list;//:(void (^)(NSArray* currentVersions)) completion;
+ (void) deal_detail: (NSString*) deal_id;
- (void) latest_deals: (NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_by_catogery:(NSString*) catogery_id startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_by_search_name:(NSString*) keyword startIndex:(NSString*) start_index itemsPerPage:(NSString*) items_per_page;
+ (void) deal_around_you:(NSString*) user_lat userLng:(NSString*) user_lng;
+ (void) currency;



@end

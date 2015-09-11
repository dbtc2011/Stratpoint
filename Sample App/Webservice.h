//
//  Webservice.h
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebserviceDelegate;

@interface Webservice : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

// Method
- (void)sendPostWithParameter: (NSDictionary *)parameter;
// Properties
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSMutableDictionary *parameter;
@property (strong, nonatomic) NSMutableData *dataResponse;

@property (assign) id<WebserviceDelegate>delegate;

@end

@protocol WebserviceDelegate <NSObject>

@optional

- (void)webserviceReceivedData: (id)object;

@end
//
//  ImageDownloader.h
//  Sample App
//
//  Created by Paul Galasso on 9/10/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageDownloaderDelegate;
@interface ImageDownloader : NSOperation

#pragma mark Method
- (id)initWithLink:(NSString *)link;
#pragma mark Properties
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *link;
@property (assign) id<ImageDownloaderDelegate>delegate;

@end

@protocol ImageDownloaderDelegate <NSObject>

@optional

- (void)imageDownloader:(ImageDownloader *)downloader downloadedImage: (NSData *)data;

@end



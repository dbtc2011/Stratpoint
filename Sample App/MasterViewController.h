//
//  MasterViewController.h
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Webservice.h"
#import "MovieInformationObject.h"
#import "ImageDownloader.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <WebserviceDelegate, ImageDownloaderDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;


@end


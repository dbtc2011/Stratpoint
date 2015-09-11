//
//  DetailViewController.h
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInformationObject.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageBackground;
@property (weak, nonatomic) IBOutlet UIImageView *imageCover;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelYear;
@property (weak, nonatomic) IBOutlet UILabel *labelRate;
@property (weak, nonatomic) IBOutlet UITextView *textInfo;
@property (weak, nonatomic) IBOutlet UIImageView *ratingLayer;
@property (weak, nonatomic) IBOutlet UIImageView *yearLayer;
@property (weak, nonatomic) IBOutlet UIImageView *titleLayer;
@property (strong, nonatomic) MovieInformationObject *movieObject;

@end


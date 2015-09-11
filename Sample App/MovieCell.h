//
//  MovieCell.h
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageBackground;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabelFrame;

- (void)setupView;
@end

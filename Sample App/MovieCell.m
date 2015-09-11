//
//  MovieCell.m
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)setupView {
    
 

    self.imageLabelFrame.backgroundColor = [UIColor blackColor];
    self.imageLabelFrame.alpha = 0.3;
    self.imageLabelFrame.layer.borderWidth = 1.0;
    self.imageLabelFrame.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.contentView bringSubviewToFront:self.labelDate];
    [self.contentView bringSubviewToFront:self.labelTitle];
    
}


@end

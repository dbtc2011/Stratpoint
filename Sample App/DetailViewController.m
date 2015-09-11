//
//  DetailViewController.m
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize movieObject = _movieObject;



#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}
- (void)setMovieObject:(MovieInformationObject *)movieObject {
    if (_movieObject != movieObject) {
        _movieObject = movieObject;
        
        [self configureView];
        
    }
    
}

- (void)configureView {
    // Update the user interface for the detail item.
   
    
    if (self.movieObject.imageBackground) {
        self.imageBackground.image = [UIImage imageWithData:self.movieObject.imageBackground];
    }
    
    if (self.movieObject.coverImage) {
        self.imageCover.image = [UIImage imageWithData:self.movieObject.imageCover];
    }

    [self.labelTitle setText:self.movieObject.title];
    [self.labelYear setText:[NSString stringWithFormat:@"Year: %@",self.movieObject.year]];
    [self.labelRate setText:[NSString stringWithFormat:@"Rating:%.1f", [self.movieObject.rating floatValue]]];
    
    NSString *content = @"";
    
    content = [content stringByAppendingFormat:@"Overview : %@\n\n",self.movieObject.overview];
    content = [content stringByAppendingFormat:@"MPA Rating : %@\n",self.movieObject.mpaRating];
    content = [content stringByAppendingFormat:@"IMDB code : %@\n",self.movieObject.imdbCode];
    content = [content stringByAppendingFormat:@"Language : %@\n",self.movieObject.language];
    content = [content stringByAppendingFormat:@"Genres : "];
    for (int count = 0; count < self.movieObject.genres.count; count++) {
        content = [content stringByAppendingString:self.movieObject.genres[count]];
        if (count != self.movieObject.genres.count - 1) {
            content = [content stringByAppendingString:@", "];
        }
    }
    content = [content stringByAppendingString:@"\n"];
    content = [content stringByAppendingFormat:@"Runtime : %@\n",self.movieObject.runtime];
    
    [self.textInfo setText:content];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.yearLayer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.yearLayer.layer.borderWidth = 1.0;
    self.yearLayer.backgroundColor = [UIColor blackColor];
    self.yearLayer.alpha = 0.3;
    
    self.ratingLayer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ratingLayer.layer.borderWidth = 1.0;
    self.ratingLayer.backgroundColor = [UIColor blackColor];
    self.ratingLayer.alpha = 0.3;
    
    self.titleLayer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.titleLayer.layer.borderWidth = 1.0;
    self.titleLayer.backgroundColor = [UIColor blackColor];
    self.titleLayer.alpha = 0.3;
    
    
    [self configureView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

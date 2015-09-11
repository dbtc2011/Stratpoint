//
//  MovieInformationObject.h
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInformationObject : NSObject

@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *titleLong;
@property (strong, nonatomic) NSString *imdbCode;
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSMutableArray *genres;
@property (strong, nonatomic) NSString *slug;
@property (strong, nonatomic) NSString *mpaRating;
@property (strong, nonatomic) NSString *backgroundImage;
@property (strong, nonatomic) NSString *coverImage;
@property (strong, nonatomic) NSString *runtime;
@property (strong, nonatomic) NSData *imageBackground;
@property (strong, nonatomic) NSData *imageCover;

@end

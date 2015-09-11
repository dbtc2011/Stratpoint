//
//  MovieInformationObject.m
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "MovieInformationObject.h"

@implementation MovieInformationObject

// MARK: Getter Setter
@synthesize rating = _rating;
@synthesize language = _language;
@synthesize title = _title;
@synthesize url = _url;
@synthesize titleLong = _titleLong;
@synthesize imdbCode = _imdbCode;
@synthesize identifier = _identifier;
@synthesize state = _state;
@synthesize year = _year;
@synthesize overview = _overview;
@synthesize genres = _genres;
@synthesize slug = _slug;
@synthesize mpaRating = _mpaRating;
@synthesize backgroundImage = _backgroundImage;
@synthesize coverImage = _coverImage;
@synthesize runtime = _runtime;
@synthesize imageBackground;
@synthesize imageCover;

- (NSString *)rating {
    if (!_rating) {
        _rating = @"";
    }
    return _rating;
}

- (NSString *)language {
    if (!_language) {
        _language = @"";
    }
    return _language;
}

- (NSString *)title {
    if (!_title) {
        _title = @"";
    }
    return _title;
}

- (NSString *)url {
    if (!_url) {
        _url = @"";
    }
    return _url;
}

- (NSString *)titleLong {
    if (!_titleLong) {
        _titleLong = @"";
    }
    return _titleLong;
}

- (NSString *)imdbCode {
    if (!_imdbCode) {
        _imdbCode = @"";
    }
    return _imdbCode;
}

- (NSString *)identifier {
    if (!_identifier) {
        _identifier = @"";
    }
    return _identifier;
}

- (NSString *)state {
    if (!_state) {
        _state = @"";
    }
    return _state;
}

- (NSString *)year {
    if (!_year) {
        _year = @"";
    }
    return _year;
}

- (NSString *)overview {
    if (!_overview) {
        _overview = @"";
    }
    return _overview;
}

- (NSMutableArray *)genres {
    if (!_genres) {
        _genres = @[].mutableCopy;
    }
    return _genres;
}

- (NSString *)slug {
    if (!_slug) {
        _slug = @"";
    }
    return _slug;
}

- (NSString *)mpaRating {
    if (!_mpaRating) {
        _mpaRating = @"";
    }
    return _mpaRating;
}

- (NSString *)backgroundImage {
    if (!_backgroundImage) {
        _backgroundImage = [[NSString alloc]initWithFormat:@"https://dl.dropboxusercontent.com/u/5624850/movielist/images/%@-backdrop.jpg",self.slug];
    }
    return _backgroundImage;
}

- (NSString *)coverImage {
    if (!_coverImage) {
        _coverImage = [NSString stringWithFormat:@"https://dl.dropboxusercontent.com/u/5624850/movielist/images/%@-cover.jpg",self.slug];
    }
    return _coverImage;
}

- (NSString *)runtime {
    if (!_runtime) {
        _runtime = @"";
    }
    return _runtime;
}

@end

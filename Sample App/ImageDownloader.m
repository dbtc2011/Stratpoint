//
//  ImageDownloader.m
//  Sample App
//
//  Created by Paul Galasso on 9/10/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader{
    
}

@synthesize link = _link;
@synthesize identifier = _identifier;
@synthesize delegate;

- (NSString *)link {
    if (!_link) {
        _link = @"";
    }
    return _link;
}

- (NSString *)identifier {
    if (!_identifier) {
        _identifier = @"";
    }
    return _identifier;
}


- (id)initWithLink:(NSString *)link {
    
    
    self = [super init];
    if (self) {
        self.link = link;
    }
    
    return self;
    
}
- (void)main {
    @autoreleasepool {
        
        if (self.isCancelled) {
            return;
        }
        
       
        NSData *dataImage = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:self.link]];
        
        if (self.isCancelled) {
            return;
        }
        
        UIImage *image = [[UIImage alloc]initWithData:dataImage];
        
        if (self.isCancelled) {
            return;
        }
        
        if (image) {
            
            [self.delegate imageDownloader:self downloadedImage:dataImage];
        }
        

    }
}

@end

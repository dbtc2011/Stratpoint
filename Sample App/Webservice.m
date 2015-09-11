//
//  Webservice.m
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "Webservice.h"

@implementation Webservice{
    
    NSURLConnection *urlConnection;
    NSMutableURLRequest *request;
}

#pragma mark - Getter Setter
@synthesize link = _link;
@synthesize dataResponse = _dataResponse;
@synthesize parameter = _parameter;
@synthesize delegate;

- (NSString *)link {
    if (!_link) {
        _link = @"";
    }
    return _link;
}

- (NSMutableData *)dataResponse {
    if (!_dataResponse) {
        _dataResponse = [[NSMutableData alloc]init];
    }
    return _dataResponse;
}

#pragma mark Method
- (void)sendPostWithParameter: (NSDictionary *)parameter {

    [self.parameter addEntriesFromDictionary:parameter];
    
    NSString *stringParameter = @"";
    for (int count = 0; count < self.parameter.allKeys.count; count++) {
        NSString *key = self.parameter.allKeys[count];
        stringParameter = [stringParameter stringByAppendingFormat:@"%@=%@",key,self.parameter[key]];
        
        if (count != self.parameter.allKeys.count - 1) {
            stringParameter = [stringParameter stringByAppendingString:@"&"];
        }
    }
    
    if ([stringParameter isEqualToString:@""]) {
        stringParameter = @"---------------------------14737809831466499882746641449";
    }
    
    NSData *dataParameter = [stringParameter dataUsingEncoding:NSUTF8StringEncoding];
    
    request = [[NSMutableURLRequest alloc]init];
    request.URL = [NSURL URLWithString:self.link];
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[dataParameter length]] forHTTPHeaderField:@"Content-length"];
    request.HTTPBody = dataParameter;
    
    urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    
    
}

#pragma mark Delegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    self.dataResponse = nil;
    urlConnection = nil;
    request = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.dataResponse appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    id object = [NSJSONSerialization JSONObjectWithData:self.dataResponse options:kNilOptions error:nil];
    
    urlConnection = nil;
    request = nil;
    self.dataResponse = nil;
    [self.delegate webserviceReceivedData:object];
}





@end

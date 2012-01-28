//
//  AsyncURLConnection.m
//  AsyncURLConnectionSample
//
//  Created by 憲治 衣川 on 12/01/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AsyncURLConnection.h"

@implementation AsyncURLConnection
+ (id)request:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    return [[[self alloc] initWithRequest:requestUrl
                            completeBlock:completeBlock errorBlock:errorBlock] autorelease];
}

+ (void)dispatchAsyncTaskOnGlobalQueue:(taskBlock_t)taskBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), taskBlock);
}

+ (void)dispatchAsyncTaskOnMainQueue:(taskBlock_t)taskBlock
{
    dispatch_async(dispatch_get_main_queue(), taskBlock);
}

- (id)initWithRequest:(NSString *)requestUrl completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    
    if ((self=[super init])) {
        data_ = [[NSMutableData alloc] init];
        
        completeBlock_ = [completeBlock copy];
        errorBlock_ = [errorBlock copy];
        
        NSURL *url = [NSURL URLWithString:requestUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
    
    return self;
}

- (void)dealloc
{
    [data_ release];
    
    [completeBlock_ release];
    [errorBlock_ release];
    [super dealloc];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [data_ setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [data_ appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    completeBlock_(data_);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    errorBlock_(error);
}

@end

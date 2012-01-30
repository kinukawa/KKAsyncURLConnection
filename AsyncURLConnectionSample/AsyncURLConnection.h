//
//  AsyncURLConnection.h
//  AsyncURLConnectionSample
//
//  Created by 憲治 衣川 on 12/01/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^completeBlock_t)(NSData *data);
typedef void (^errorBlock_t)(NSError *error);
typedef void (^taskBlock_t)();


@interface AsyncURLConnection : NSObject{
    NSMutableData *data_;
    completeBlock_t completeBlock_;
    errorBlock_t errorBlock_;
}
+ (id)requestWithURL:(NSString *)url 
       completeBlock:(completeBlock_t)completeBlock 
          errorBlock:(errorBlock_t)errorBlock;

+ (id)requestWithRequest:(NSURLRequest *)request 
           completeBlock:(completeBlock_t)completeBlock 
              errorBlock:(errorBlock_t)errorBlock;

+ (void)dispatchAsyncTaskOnGlobalQueue:(taskBlock_t)taskBlock;
+ (void)dispatchAsyncTaskOnMainQueue:(taskBlock_t)taskBlock;


@end

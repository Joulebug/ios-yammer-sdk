//
//  YMAPIClient.h
//
//  Copyright (c) 2013 Yammer, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

extern NSString * const YMBaseURL;

/**
 Represents an object that contains a queue of HTTP operations.
 At the moment, this is essentially a lightweight wrapper around AFHTTPRequestOperationManager.
 */
@interface YMAPIClient : NSObject
@property (nonatomic, copy) NSString *authToken;

/**
 Default initializer.
 @param authToken The OAuth token.
 */
- (id)initWithAuthToken:(NSString *)authToken;

/**
 Performs an async GET request.
 @param path The path
 @param parameters The request parameters
 @param success The success block
 @param failure The failure block
 */
- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 Performs an async POST request.
 @param path The path
 @param parameters The request parameters
 @param success The success block
 @param failure The failure block
 */
- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSInteger statusCode, NSError *error))failure;

@end
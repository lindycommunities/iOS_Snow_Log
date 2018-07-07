//
//  BaseManager.h
//  SoapAfNetworkingTest
//
//  Created by Bonnie Jaiswal on 04/06/15.
//  Copyright (c) 2015 Bonnie Jaiswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomError.h"
#import "SLWebRequestHelper.h"
#import "SLBaseRequest.h"
#import "SLBaseResponse.h"

typedef void (^successBlock)(SLBaseResponse *result);
typedef void (^failureBlock)(CustomError *error);

typedef void (^successBlockWithBlock)(SLBaseResponse *result, void (^)());
typedef void (^failureBlockWithBlock)(CustomError *error, void (^)());

typedef void(^successBlockArray)(NSArray *resultArray);

@interface SLBaseManager : NSObject
- (CustomError *)createErrorFromResponse:(SLBaseResponse *)responseDictionary;
- (CustomError *)GetCustomErrorFromNSError:(NSError *)error;


- (id)parseResponse:(NSDictionary *)dict
          forAction:(NSString *)action;

-(void)reloginWithRequest:(SLBaseRequest *)request
                  success:(successBlock)success
                  failure:(failureBlock)failure;

-(void)reloginForChangeMpin:(successBlock)success
                    failure:(failureBlock)failure;

-(void)reloginWithRequest:(SLBaseRequest *)request
         parentController:(id)parentController
                  success:(successBlock)success
                  failure:(failureBlock)failure;

-(void)reloginForInitiatedTransactionAmount:(NSString *) amount
                                withRequest:(SLBaseRequest *)request
                                    success:(successBlock)success
                                    failure:(failureBlock)failure;

-(void)resetAuthTokenWithRequest:(SLBaseRequest *)resetAuthTokenRequest
                     success:(successBlock)success
                     failure:(failureBlock)failure;

- (NSString *)getResponseBody:(NSDictionary *)jsonDict
                    forAction:(NSString *)action;

- (UIViewController*) topMostController;

+ (instancetype)sharedInstance;

@end

//
//  WebRequestHelper.h
//  AxisWallet
//
//  Created by Bonnie Jaiswal on 02/06/15.
//  Copyright (c) 2012 Bonnie Jaiswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ServiceResponse.h"
#import "CustomError.h"
#import "SLBaseRequest.h"

#define kBaseURL @"http://certification.comehometolindy.com/certificate-production_api/api/snow-log-api.php?action="


@interface SLWebRequestHelper : NSObject
+ (instancetype)sharedInstance;

- (void)hitRequestServiceFor:(SLBaseRequest *)soapRequest
                     success:(void (^) (NSDictionary *result))success
                     failure:(void (^) (CustomError *error))failure;

- (void)requestServiceFor:(SLBaseRequest *)soapRequest
                  success:(void (^) (NSDictionary *result))success
                  failure:(void (^) (CustomError *error))failure;


@end

//
//  WebRequestHelper.m
//  AxisWallet
//
//  Created by Bonnie Jaiswal on 02/06/15.
//  Copyright (c) 2012 Bonnie Jaiswal. All rights reserved.
//

#import "SLWebRequestHelper.h"
#import <AFNetworking/AFNetworking.h>
//#import "SLBaseResponse.h"
//#import "SLBaseManager.h"
#import <KSToastView/KSToastView.h>

@interface SLWebRequestHelper(){
    NSMutableArray *certsArray;
    int countRetry;
}

@end

@implementation SLWebRequestHelper


+ (instancetype)sharedInstance {
    static SLWebRequestHelper *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SLWebRequestHelper alloc] init];
    });
    return _sharedInstance;
}


- (void)hitRequestServiceFor:(SLBaseRequest *)request
                  success:(void (^) (NSDictionary *result))success
                  failure:(void (^) (CustomError *error))failure {
    


    if(![[AFNetworkReachabilityManager sharedManager]isReachable]){

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            
            //@"http://www.whitelakeinteractive.com/level7tennis/api/level7api.php?xAction=member_login"
            //@"http://requestb.in/ucr5w1uc"
            
            NSDictionary *parametersDict = [request dictionary];


            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            
            NSString *urlStr = [NSString stringWithFormat:@"%@%@",kBaseURL,request.action];

            NSLog(@"Request :- %@ \n %@",urlStr,parametersDict);

            [manager POST:urlStr parameters:parametersDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSLog(@"Response :- %@",responseObject);

                if ([responseObject[@"success"]boolValue]) {
                    NSLog(@"success!");
                    success(responseObject);
                }
                else{
                    
                    failure([self createCustomErrorFromText:responseObject[@"message"]]);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"error: %@", error);
                failure([self GetCustomErrorFromNSError:error]);
            }];
        });
    }
    else
    {
        // showing error here, shows it many times, eg opening oneView will show 3-4 alerts, becase many requests in one screen.
        //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"@Lime" message:@"Please check your internet connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //        [alert show];
        [KSToastView ks_showToast:@"Please check your internet connection" duration:2.0f];
        
        failure([self createNoInternetError]);
    }

}

- (CustomError *)GetCustomErrorFromNSError:(NSError *)error {
    CustomError *cerror = [[CustomError alloc]init];
    //TODO: code to extract human readable Error from NSError.
    cerror.isSuccess = false;
    NSString *errorDesc = @"";
    switch (error.code) {
        case 500:
            errorDesc = @"xxxx";
            break;
            
        default:
            errorDesc = [NSString stringWithFormat:@"%@",error.localizedDescription];
            break;
    }
    cerror.errorCode = @"999";
    cerror.errorDescription = errorDesc;
    return cerror;
}

- (CustomError *)createNoInternetError {
    CustomError *cerror=[[CustomError alloc]init];
    //TODO: code to extract human readable Error from NSError.
    cerror.isSuccess=false;
    cerror.errorCode = @"998";
    cerror.errorDescription=[NSString stringWithFormat:@"Please check your internet connection"];
    return cerror;
}

- (CustomError *)createCustomErrorFromText:(NSString *)errorText {
    CustomError *cerror=[[CustomError alloc]init];
    //TODO: code to extract human readable Error from NSError.
    cerror.isSuccess=false;
    cerror.errorCode = @"100";
    cerror.errorDescription=[NSString stringWithFormat:@"%@",errorText];
    return cerror;
}


@end

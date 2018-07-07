//
//  VideosManager.m
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+ (instancetype)sharedInstance {
    static WebServiceManager *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WebServiceManager alloc] init];
    });
    return _sharedInstance;
}


//- (void)GetVideosForRequest:(AdminGetVideosListRequest *)request
//                     success:(successBlock)success
//                     failure:(failureBlock)failure {
//    
//    request.action = @"get_trainer_videos";
//
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:request success:^(NSDictionary *result) {
//        
//        AWGetVideosListResponse *response = [[AWGetVideosListResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//    
//}
//
//
////- (void)GetEfficiencySkillsForRequest:(AcademyGetSkillListRequest *)request
////                              success:(successBlock)success
////                              failure:(failureBlock)failure{
////    
////    
////    request.action = @"get_all_expertise_areas";
////    
////    
////    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
////    [webHelper hitRequestServiceFor:request success:^(NSDictionary *result) {
////        
////        AcademyGetSkillListResponse *response = [[AcademyGetSkillListResponse alloc]initWithDictionary:result error:nil];
////        success(response);
////        
////    } failure:^(CustomError *error) {
////        failure(error);
////    }];
////
////    
////}
//
- (void)GetPropertyListWithSuccess:(successBlock)success
                                    failure:(failureBlock)failure {
    
    SLBaseRequest *getOpponentListRequest = [[SLBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getProperty";
    
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetPropertyListResponse *response = [[GetPropertyListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}

- (void)GetQuantityListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    SLBaseRequest *getOpponentListRequest = [[SLBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getQuantity";
    
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetQuantityListResponse *response = [[GetQuantityListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetEquipmentListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    SLBaseRequest *getOpponentListRequest = [[SLBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getEquipment";
    
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetEquipmentListResponse *response = [[GetEquipmentListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)GetWeightListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure {
    
    SLBaseRequest *getOpponentListRequest = [[SLBaseRequest alloc]init];
    
    getOpponentListRequest.action = @"getWeight";
    
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
        
        GetWeightListResponse *response = [[GetWeightListResponse alloc]initWithDictionary:result error:nil];
        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
//- (void)GetEfficiencyLevelsForPlayerWithSuccess:(successBlock)success
//                                        failure:(failureBlock)failure {
//    
//    AWBaseRequest *getOpponentListRequest = [[AWBaseRequest alloc]init];
//    
//    getOpponentListRequest.action = @"get_levels";
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
//        
//        AcademyGetLevelsListResponse *response = [[AcademyGetLevelsListResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//    
//}
//
//
//
//
//
- (void)AddSnowLogFormForRequest:(AddSnowLogRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;
{

    addSnowLogRequest.action = @"addRecord";
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
        GetSnowLogResponse *response = [[GetSnowLogResponse alloc]initWithDictionary:result error:nil];
        
        success(response);

        
//        SLBaseResponse *response = [[SLBaseResponse alloc]initWithDictionary:result error:nil];
//        success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
- (void)AddSnowLogFormImagesForRequest:(AddSnowLogImageRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;
{
    
    addSnowLogRequest.action = @"addImages";
    SLWebRequestHelper *webHelper = [SLWebRequestHelper sharedInstance];
    [webHelper hitRequestServiceFor:addSnowLogRequest success:^(NSDictionary *result) {
        
        
//        GetSnowLogResponse *response = [[GetSnowLogResponse alloc]initWithDictionary:result error:nil];
//        
//        success(response);
        
        
                SLBaseResponse *response = [[SLBaseResponse alloc]initWithDictionary:result error:nil];
                success(response);
        
    } failure:^(CustomError *error) {
        failure(error);
    }];
    
}
//- (void)GetEfficiencyListForRequest:(AcademyGetEfficiencyRequest *)request
//                            success:(successBlock)success
//                            failure:(failureBlock)failure{
//    
//    
//    AWBaseRequest *getOpponentListRequest = [[AWBaseRequest alloc]init];
//    
//    getOpponentListRequest.action = @"get_all_efficiencies";
//    
//    AWWebRequestHelper *webHelper = [AWWebRequestHelper sharedInstance];
//    [webHelper hitRequestServiceFor:getOpponentListRequest success:^(NSDictionary *result) {
//        
//        
//        
//        AcademyGetSkillListResponse *response = [[AcademyGetSkillListResponse alloc]initWithDictionary:result error:nil];
//        success(response);
//        
//    } failure:^(CustomError *error) {
//        failure(error);
//    }];
//
//}




@end

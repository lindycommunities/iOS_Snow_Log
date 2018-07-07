//
//  VideosManager.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseManager.h"
//#import "AcademyAddEfficiencyRequest.h"
//#import "AdminGetVideosListRequest.h"
//#import "AWGetVideosListResponse.h"
//#import "AcademyGetLevelsListResponse.h"
//#import "AcademyGetEfficiencyRequest.h"
//
//
//
#import "GetPropertyListResponse.h"
#import "GetEquipmentListResponse.h"
#import "GetWeightListResponse.h"
#import "GetQuantityListResponse.h"
#import "AddSnowLogRequest.h"
#import "GetSnowLogResponse.h"
#import "AddSnowLogImageRequest.h"

//#import "AcademyGetSkillListResponse.h"

@interface WebServiceManager: SLBaseManager

//- (void)GetVideosForRequest:(AdminGetVideosListRequest *)request
//                    success:(successBlock)success
//                    failure:(failureBlock)failure;
//
//
- (void)AddSnowLogFormForRequest:(AddSnowLogRequest *)addSnowLogRequest
                   success:(successBlock)success
                   failure:(failureBlock)failure;


- (void)AddSnowLogFormImagesForRequest:(AddSnowLogImageRequest *)addSnowLogRequest
                         success:(successBlock)success
                         failure:(failureBlock)failure;


//- (void)GetPropertyForRequest:(SLBaseRequest *)request
//                    success:(successBlock)success
//                    failure:(failureBlock)failure;


//- (void)GetEfficiencyListForRequest:(AcademyGetEfficiencyRequest *)request
//                              success:(successBlock)success
//                              failure:(failureBlock)failure;
//
//
- (void)GetPropertyListWithSuccess:(successBlock)success
                                        failure:(failureBlock)failure;

- (void)GetEquipmentListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;
- (void)GetWeightListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;
- (void)GetQuantityListWithSuccess:(successBlock)success
                           failure:(failureBlock)failure;


//- (void)GetEfficiencyLevelsForPlayerWithSuccess:(successBlock)success
//                                        failure:(failureBlock)failure;
//

@end

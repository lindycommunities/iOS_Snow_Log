//
//  BaseModel.h
//  AxisWallet
//
//  Created by Hemant Chittora on 03/06/15.
//  Copyright (c) 2015 Hemant Chittora. All rights reserved.
//

#import "SLBaseModel.h"


@interface SLBaseRequest : SLBaseModel
@property (nonatomic, strong) NSString *action;
- (NSDictionary *)dictionary;
- (NSArray *)paramsOrderArray;
- (NSString *)requestString;
@end

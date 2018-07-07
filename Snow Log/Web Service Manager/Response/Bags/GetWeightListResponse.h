//
//  AWGetVideosListResponse.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseResponse.h"
#import "Weight.h"

@interface GetWeightListResponse : SLBaseResponse

@property (nonatomic) NSArray <Weight> *result;

@end

//
//  AWGetVideosListResponse.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseResponse.h"
#import "Quantity.h"

@interface GetQuantityListResponse : SLBaseResponse

@property (nonatomic) NSArray <Quantity> *result;

@end

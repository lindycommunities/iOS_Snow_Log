//
//  Video.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 20/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseModel.h"

@protocol Weight <NSObject>
@end

@interface Weight : SLBaseModel

//@property (nonatomic) NSString *categoryID;
@property (nonatomic) NSString *weight;

@end

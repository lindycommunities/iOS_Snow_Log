//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseRequest.h"

@interface AddSnowLogImageRequest : SLBaseRequest


@property (nonatomic,strong) NSString *form_id;
@property (nonatomic,strong) NSString *image_base64;
@property (nonatomic,strong) NSString *islast_flag;
@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord


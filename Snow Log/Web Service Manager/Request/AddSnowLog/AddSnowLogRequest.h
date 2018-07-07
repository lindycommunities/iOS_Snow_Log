//
//  AddVideoRequest.h
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 18/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "SLBaseRequest.h"

@interface AddSnowLogRequest : SLBaseRequest


@property (nonatomic,strong) NSString *form_date;
@property (nonatomic,strong) NSString *property_name;
@property (nonatomic,strong) NSString *employee_name1,*employee_name2,*employee_name3,*employee_name4,*employee_name5;
@property (nonatomic,strong) NSString *time_in;
@property (nonatomic,strong) NSString *time_out;
@property (nonatomic,strong) NSString *areas_cleared;
@property (nonatomic,strong) NSString *equipment_used;
@property (nonatomic,strong) NSString *snowmeltused;
@property (nonatomic,strong) NSString *poundsdistributed;
@property (nonatomic, strong) NSMutableDictionary *selectedIndexDictionary;
@property (nonatomic, strong) NSMutableArray *selectedIndexValue;


/*@property (nonatomic,strong) NSString *calcium;
@property (nonatomic,strong) NSString *calcium_weight_bags;
@property (nonatomic,strong) NSString *rock_salt;
@property (nonatomic,strong) NSString *salt_weight_bags;
*/


@property (nonatomic,strong) NSString *base_concrete;
@property (nonatomic,strong) NSString *base_concrete_reason;
@property (nonatomic,strong) NSString *other_notes;
@property (nonatomic,strong) NSString *islast_flag;


@end

//https://www.whitelakeinteractive.com/lindy-certification/certificate-production_api/api/snow-log-api.php?action=addRecord


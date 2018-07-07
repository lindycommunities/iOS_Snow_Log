//
//  ViewController.m
//  Snow Log
//
//  Created by S S D on 18/03/17.
//  Copyright © 2017 Snow Log. All rights reserved.
//

#import "ViewController1.h"
#import "GetPropertyListResponse.h"
#import "ViewController2.h"
@interface ViewController1(){

}
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (strong, nonatomic) IBOutlet UITextField *TxtArea;
@property (strong, nonatomic) IBOutlet UITextField *TxtEquipment;
@property (strong, nonatomic) IBOutlet UITextField *TxtSnowMeltUsed;
@property (strong, nonatomic)  UITextField *Active_Textfield;
@property (strong, nonatomic) IBOutlet UILabel *LblPoundsdistributed;
@property (strong, nonatomic) IBOutlet UITextView *TxtPoundsdistributed;
@property (strong, nonatomic) IBOutlet UIView *ViewPoundsdistributed;
@property (strong, nonatomic) IBOutlet UIView *ViewEquipment;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ViewEquipmentHeight;
@property (strong, nonatomic) IBOutlet UITextView *TxtViewEquipmentUsed;

@property(nonnull,retain)NSArray *arrEquipment,*arrSnowMeltUsed;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *BtnNextYPosition;


@end

@implementation ViewController1
@synthesize snowlogformtoAdd1,arrImages;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TxtArea.text=self.snowlogformtoAdd1.areas_cleared;
    //self.TxtEquipment.text=self.snowlogformtoAdd1.equipment_used;
    self.selectedIndexDictionary=self.snowlogformtoAdd1.selectedIndexDictionary;
    self.selectedIndexValue=self.snowlogformtoAdd1.selectedIndexValue;
    self.TxtSnowMeltUsed.text=self.snowlogformtoAdd1.snowmeltused;
    self.TxtPoundsdistributed.text=self.snowlogformtoAdd1.poundsdistributed;
    
    if(self.selectedIndexValue.count){
        
        self.TxtEquipment.placeholder=@"View Selected Item";
    }
    else
    {
        self.TxtEquipment.placeholder=@"Select Item";
        
    }

    
    
    /*
    NSArray *arr =[self.snowlogformtoAdd1.equipment_used componentsSeparatedByString:@","];
    
    
    if(arr.count>1){
        
        self.TxtViewEquipmentUsed.hidden=NO;
        self.TxtViewEquipmentUsed.text=@"";
        self.TxtEquipment.text=@"";
        for(id aitem in arr){
            
            if(!self.TxtEquipment.text.length)
            {
                self.TxtEquipment.text=aitem;
                
            }
            else
            {
                if(self.TxtViewEquipmentUsed.text.length){
                    self.TxtViewEquipmentUsed.text=[NSString stringWithFormat:@"%@,%@",self.TxtViewEquipmentUsed.text,aitem];
                }
                else
                {
                    
                    self.TxtViewEquipmentUsed.text=[NSString stringWithFormat:@"%@",aitem];
                    
                }
            }
        }
        
        
        self.ViewEquipmentHeight.active = YES;
        self.ViewEquipmentHeight.constant=160.0f;
        [self.view layoutIfNeeded];
    }
    else
    {
        if(arr.count){
            self.TxtViewEquipmentUsed.hidden=YES;
            self.ViewEquipmentHeight.active = YES;
            self.ViewEquipmentHeight.constant=80.0f;
            [self.view layoutIfNeeded];
            
            self.TxtEquipment.text=[arr objectAtIndex:0];
        }
        else{
            
            
            
        }
    }

    
    */
    
    
   // self.TxtSnowMeltUsed.text=self.snowlogformtoAdd1.calcium;
    //self.TxtPoundsdistributed.text=self.snowlogformtoAdd1.calcium;

    
    
    [self setScrollViewSize];
    [self SnowMeltUsed];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView1) name:@"ScanCompleted1" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)updateView1{
    self.snowlogformtoAdd1=nil;
    self.TxtArea.text=nil;
    self.TxtEquipment.text=nil;
    self.TxtViewEquipmentUsed.text=nil;
    self.TxtSnowMeltUsed.text=nil;
    self.TxtPoundsdistributed.text=nil;
    self.selectedIndexDictionary=nil;
    self.selectedIndexValue=nil;

    
    
    [self SnowMeltUsed];
    
}
-(void)setScrollViewSize{
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.ScrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.ScrollView.contentSize = contentRect.size;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    self.arrSnowMeltUsed = [[NSArray alloc]initWithObjects:@{@"SnowMeltUsed":@"No"},@{@"SnowMeltUsed":@"Yes"}, nil];
    
    
    
    
}


//-(void)getAllProperty{
//    
//    [self startLoading];
//    
//    
//    [[WebServiceManager sharedInstance]GetPropertyListWithSuccess:^(SLBaseResponse *result) {
//        
//        [self stopLoading];
//        
//        GetPropertyListResponse *response = (GetPropertyListResponse *)result;
//        if (response.result.count) {
//            self.arrProperty = [[NSArray alloc]initWithArray:response.result];
//            [self showSelectionVCForOpponents];
//        }
//        else{
//            
//            [self showToastForText:@"No Skills Found"];
//            
//        }
//        
//    } failure:^(CustomError *error) {
//        [self stopLoading];
//        
//        [self showToastForText:@"Cannot fetch Skills. Please try again"];
//    }];
//    
//}







- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImageJPEGRepresentation(image, 0.3) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
-(UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}
-(void)showSelectionVCForOpponents{
    
    
    
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
    if([self.Active_Textfield isEqual:self.TxtEquipment]){

    aWSelectionViewController.itemList = self.arrEquipment;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"equipment"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.titleForSelection = @"Select Equipment";
        aWSelectionViewController.isMutliSelect=YES;
        aWSelectionViewController.selectedIndexDictionary=_selectedIndexDictionary;
        aWSelectionViewController.selectedIndexValue=_selectedIndexValue;
}
    else if([self.Active_Textfield isEqual:self.TxtSnowMeltUsed]){
        
        aWSelectionViewController.itemList = self.arrSnowMeltUsed;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"SnowMeltUsed"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.titleForSelection = @"Select Snow Melt Used";
    }
    
        
        aWSelectionViewController.delegate  = self;
        [self presentViewController:aWSelectionViewController animated:YES completion:nil];
        
        
    
    
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.

    self.Active_Textfield=textField;
    if([textField isEqual:self.TxtEquipment]){
    
        
        if(self.arrEquipment.count){
            
            [self showSelectionVCForOpponents];

        }
        else
        {
            [self getAllEquipment];

        }
    
        return NO;
    }
    else if([textField isEqual:self.TxtSnowMeltUsed]){
        
        
        if(self.arrSnowMeltUsed.count){
            
            [self showSelectionVCForOpponents];
            
        }
        
            
        return NO;
    }
        else {
    
        return YES;
    }
}
-(void)didSelectItem:(SLBaseModel *)selectedItem{
    
    if([self.Active_Textfield isEqual:self.TxtEquipment]){

        Equipment *opponent = (Equipment *)selectedItem;
        
        self.TxtEquipment.text = opponent.equipment;
    }
    else if([self.Active_Textfield isEqual:self.TxtSnowMeltUsed]){
        
        SLBaseModel *opponent = (SLBaseModel *)selectedItem;
        
        self.TxtSnowMeltUsed.text = [opponent valueForKey:@"SnowMeltUsed"];
        [self SnowMeltUsed];

        
    }
        
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}
- (void)didSelectMultipleItem:(NSMutableArray *)selectedItems andIndexes:(NSMutableDictionary *)selectedIndexesDictionary{
    
    _selectedIndexValue=selectedItems;
    _selectedIndexDictionary=selectedIndexesDictionary;
    
    //    self.ViewEquipment.frame=CGRectMake(self.ViewEquipment.frame.origin.x, self.ViewEquipment.frame.origin.y, self.ViewEquipment.frame.size.width, self.ViewEquipment.frame.size.height+50);
    
    self.snowlogformtoAdd1.equipment_used=nil;
    self.snowlogformtoAdd1.selectedIndexValue=nil;
    self.snowlogformtoAdd1.selectedIndexDictionary=nil;
    self.snowlogformtoAdd1.selectedIndexValue=selectedItems;
    self.snowlogformtoAdd1.selectedIndexDictionary=selectedIndexesDictionary;
    if(selectedItems.count){
        
        self.TxtEquipment.placeholder=@"View Selected Item";
    }
    else
    {
        self.TxtEquipment.placeholder=@"Select Item";

    }

}
- (void)didSelectMultipleItemOLD:(NSMutableArray *)selectedItems andIndexes:(NSMutableDictionary *)selectedIndexesDictionary{
    
    _selectedIndexValue=selectedItems;
    _selectedIndexDictionary=selectedIndexesDictionary;
    
//    self.ViewEquipment.frame=CGRectMake(self.ViewEquipment.frame.origin.x, self.ViewEquipment.frame.origin.y, self.ViewEquipment.frame.size.width, self.ViewEquipment.frame.size.height+50);
    
    self.snowlogformtoAdd1.equipment_used=nil;
    self.snowlogformtoAdd1.selectedIndexValue=nil;
    self.snowlogformtoAdd1.selectedIndexDictionary=nil;
    self.snowlogformtoAdd1.selectedIndexValue=selectedItems;
    self.snowlogformtoAdd1.selectedIndexDictionary=selectedIndexesDictionary;

    if(selectedItems.count>1){
    
       // [selectedItems removeObjectAtIndex:0];
        self.TxtViewEquipmentUsed.hidden=NO;
        self.TxtViewEquipmentUsed.text=@"";
        self.TxtEquipment.text=@"";
        for(id aitem in selectedItems){
            
            if(!self.TxtEquipment.text.length)
            {
                self.TxtEquipment.text=[aitem valueForKey:@"equipment"];

            }
            else
            {
            if(self.TxtViewEquipmentUsed.text.length){
            self.TxtViewEquipmentUsed.text=[NSString stringWithFormat:@"%@,%@",self.TxtViewEquipmentUsed.text,[aitem valueForKey:@"equipment"]];
            }
            else
            {

                self.TxtViewEquipmentUsed.text=[NSString stringWithFormat:@"%@",[aitem valueForKey:@"equipment"]];

            }
            }
        }
        
        
    self.ViewEquipmentHeight.active = YES;
    self.ViewEquipmentHeight.constant=160.0f;
    [self.view layoutIfNeeded];
    }
    else
    {
        if(selectedItems.count){
        self.TxtViewEquipmentUsed.hidden=YES;
        self.ViewEquipmentHeight.active = YES;
        self.ViewEquipmentHeight.constant=80.0f;
        [self.view layoutIfNeeded];

        self.TxtEquipment.text=[[selectedItems objectAtIndex:0]valueForKey:@"equipment"];
        }
        else{
            
            
            
        }
    }

    
    
    
}

-(void)SnowMeltUsed
{
    if([self.TxtSnowMeltUsed.text isEqualToString:@"Yes"]){
        
        self.ViewPoundsdistributed.hidden=NO;
        self.BtnNextYPosition.active = YES;
        
        self.BtnNextYPosition.constant=175.0f;
        [self.view layoutIfNeeded];


    }
    else
    {
        self.ViewPoundsdistributed.hidden=YES;
        self.BtnNextYPosition.active = YES;
        self.BtnNextYPosition.constant=50.0f;
        [self.view layoutIfNeeded];

    }
    
}
-(void)getAllEquipment{
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetEquipmentListWithSuccess:^(SLBaseResponse *result) {
        
        [self stopLoading];
        
        GetEquipmentListResponse *response = (GetEquipmentListResponse *)result;
        if (response.result.count) {
            self.arrEquipment = [[NSArray alloc]initWithArray:response.result];
            [self showSelectionVCForOpponents];
        }
        else{
            
            [self showToastForText:@"No Equipment Found"];
            
        }
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Cannot fetch Equipment. Please try again"];
    }];
    
}
//-(void)getAllQuantity{
//    
//    [self startLoading];
//    
//    
//    [[WebServiceManager sharedInstance]GetQuantityListWithSuccess:^(SLBaseResponse *result) {
//        
//        [self stopLoading];
//        
//        GetQuantityListResponse *response = (GetQuantityListResponse *)result;
//        if (response.result.count) {
//            self.arrQuantity = [[NSArray alloc]initWithArray:response.result];
//            [self showSelectionVCForOpponents];
//        }
//        else{
//            
//            [self showToastForText:@"No Quantity Found"];
//            
//        }
//        
//    } failure:^(CustomError *error) {
//        [self stopLoading];
//        
//        [self showToastForText:@"Cannot fetch Quantity. Please try again"];
//    }];
//    
//}
//-(void)getAllWeight{
//    
//    [self startLoading];
//    
//    
//    [[WebServiceManager sharedInstance]GetWeightListWithSuccess:^(SLBaseResponse *result) {
//        
//        [self stopLoading];
//        
//        GetWeightListResponse *response = (GetWeightListResponse *)result;
//        if (response.result.count) {
//            self.arrWeight = [[NSArray alloc]initWithArray:response.result];
//            [self showSelectionVCForOpponents];
//        }
//        else{
//            
//            [self showToastForText:@"No Weight Found"];
//            
//        }
//        
//    } failure:^(CustomError *error) {
//        [self stopLoading];
//        
//        [self showToastForText:@"Cannot fetch Weight. Please try again"];
//    }];
//
#pragma mark - Navigation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    
#if TARGET_IPHONE_SIMULATOR
    
    // Simulator specific code
    return YES;
    
    
#else // TARGET_IPHONE_SIMULATOR
    
    // Device specific code
    
    
    
    
    if([identifier isEqualToString:@"GoToNextView"]){
        
        if([self.TxtSnowMeltUsed.text isEqualToString:@"Yes"]){
            
            if(self.TxtPoundsdistributed.text.length){
                
                return YES;

            }
            else{
                
               
                    [self showToastForText:@"Please Enter Pounds distributed"];
                    
                    return NO;
                
            }
            
        }
        else{
            
            return YES;

        }
        
    }
    else
    {
        return NO;
    }
#endif // TARGET_IPHONE_SIMULATOR
    
    
}
//}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"GoToNextView"]){
        
        
        ViewController2 *view2 = segue.destinationViewController;
        self.snowlogformtoAdd1.areas_cleared=self.TxtArea.text;
//        if(!self.TxtViewEquipmentUsed.text.length){
//            self.snowlogformtoAdd1.equipment_used=[NSString stringWithFormat:@"%@",self.TxtEquipment.text];
//
//        }
//        else
//        {
//            self.snowlogformtoAdd1.equipment_used=[NSString stringWithFormat:@"%@,%@",self.TxtEquipment.text,self.TxtViewEquipmentUsed.text];
//
//        }
        NSString *joinedComponents = [[self.selectedIndexValue valueForKey:@"equipment"] componentsJoinedByString:@","];
        self.snowlogformtoAdd1.equipment_used =joinedComponents;
        self.snowlogformtoAdd1.snowmeltused=self.TxtSnowMeltUsed.text;
        self.snowlogformtoAdd1.poundsdistributed=self.TxtPoundsdistributed.text;
//        self.snowlogformtoAdd1.calcium=self.TxtCalcium.text;
//        self.snowlogformtoAdd1.calcium_weight_bags=self.TxtCalcium_Bags.text;
//        self.snowlogformtoAdd1.rock_salt=self.TxtRockSalt.text;
//        self.snowlogformtoAdd1.salt_weight_bags=self.TxtRockSalt_Bags.text;
        view2.snowlogformtoAdd2=self.snowlogformtoAdd1;
        //view2.arrImages=self.arrImages;

        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (IBAction)back_BtnPressed:(id)sender{
    
    self.snowlogformtoAdd1.areas_cleared=self.TxtArea.text;
    //self.snowlogformtoAdd1.equipment_used=self.TxtEquipment.text;
    
    NSString *joinedComponents = [[self.selectedIndexValue valueForKey:@"equipment"] componentsJoinedByString:@","];
    self.snowlogformtoAdd1.equipment_used =joinedComponents;

    
//    if(!self.TxtViewEquipmentUsed.text.length){
//        self.snowlogformtoAdd1.equipment_used=[NSString stringWithFormat:@"%@",self.TxtEquipment.text];
//        
//    }
//    else
//    {
//        self.snowlogformtoAdd1.equipment_used=[NSString stringWithFormat:@"%@,%@",self.TxtEquipment.text,self.TxtViewEquipmentUsed.text];
//        
//    }
    self.snowlogformtoAdd1.snowmeltused=self.TxtSnowMeltUsed.text;
    self.snowlogformtoAdd1.poundsdistributed=self.TxtPoundsdistributed.text;

    
    
    //    self.snowlogformtoAdd1.calcium=self.TxtCalcium.text;
//    self.snowlogformtoAdd1.calcium_weight_bags=self.TxtCalcium_Bags.text;
//    self.snowlogformtoAdd1.rock_salt=self.TxtRockSalt.text;
//    self.snowlogformtoAdd1.salt_weight_bags=self.TxtRockSalt_Bags.text;

    [self.navigationController popViewControllerAnimated:YES];
}


@end

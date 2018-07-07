//
//  ViewController.m
//  Snow Log
//
//  Created by S S D on 18/03/17.
//  Copyright © 2017 Snow Log. All rights reserved.
//

#import "ViewController.h"
#import "GetPropertyListResponse.h"
#import "ViewController1.h"

@interface ViewController(){
    
    int employeecount;
    AddSnowLogRequest *snowlogformtoAdd;

}
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property(nonatomic,retain)NSString *DATEYYMMDD;
@property(nonatomic,retain)AddSnowLogRequest *snowlogformtoAdd;

@property (strong, nonatomic) IBOutlet UIView *ViewDate;
@property (strong, nonatomic) IBOutlet UIView *ViewProperty;
@property (strong, nonatomic) IBOutlet UIView *ViewEmployeeName1;
@property (strong, nonatomic) IBOutlet UIView *ViewEmployeeName2;
@property (strong, nonatomic) IBOutlet UIView *ViewEmployeeName3;
@property (strong, nonatomic) IBOutlet UIView *ViewEmployeeName4;
@property (strong, nonatomic) IBOutlet UIView *ViewEmployeeName5;
@property (strong, nonatomic) IBOutlet UIButton *BtnAddMore;
- (IBAction)AddMoreEmployee:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *BtnAccachPhoto;
- (IBAction)AttachPhoto:(id)sender;
@property(nonnull,retain)NSMutableArray *arrImages;
@property(nonnull,retain)NSArray *arrProperty;

@property (strong, nonatomic) IBOutlet UITextField *TxtProperty;
@property (strong, nonatomic) IBOutlet UIButton *BtnNext;

@property (strong, nonatomic) IBOutlet UITextField *TxtDate;
@property (strong, nonatomic) IBOutlet UITextField *TxtEmployee1;
@property (strong, nonatomic) IBOutlet UITextField *TxtEmployee2;
@property (strong, nonatomic) IBOutlet UITextField *TxtEmployee3;
@property (strong, nonatomic) IBOutlet UITextField *TxtEmployee4;
@property (strong, nonatomic) IBOutlet UITextField *TxtEmployee5;


@end

@implementation ViewController
@synthesize snowlogformtoAdd;
@synthesize arrImages,arrProperty;
- (void)viewDidLoad {
    [super viewDidLoad];
    employeecount=1;
    [self setaddmoreButton];
    [self setScrollViewSize];
    self.arrImages=[[NSMutableArray alloc]init];
    
    self.snowlogformtoAdd = [[AddSnowLogRequest alloc]init];

    self.DATEYYMMDD=self.snowlogformtoAdd.form_date;
    self.TxtProperty.text=self.snowlogformtoAdd.property_name;
    self.TxtEmployee1.text=self.snowlogformtoAdd.employee_name1;
    self.TxtEmployee2.text=self.snowlogformtoAdd.employee_name2;
    self.TxtEmployee3.text=self.snowlogformtoAdd.employee_name3;
    self.TxtEmployee4.text=self.snowlogformtoAdd.employee_name4;
    self.TxtEmployee5.text=self.snowlogformtoAdd.employee_name5;
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"ScanCompleted" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)updateView{
    
    [scrolimages removeFromSuperview];
    self.snowlogformtoAdd=nil;

    self.arrImages=nil;
    
    self.DATEYYMMDD=nil;
    self.TxtProperty.text=nil;
    self.TxtEmployee1.text=nil;
    self.TxtEmployee2.text=nil;
    self.TxtEmployee3.text=nil;
    self.TxtEmployee4.text=nil;
    self.TxtEmployee5.text=nil;
    self.TxtDate.text=nil;
    self.ViewEmployeeName2.hidden=YES;
    self.ViewEmployeeName3.hidden=YES;
    self.ViewEmployeeName4.hidden=YES;
    self.ViewEmployeeName5.hidden=YES;
    employeecount=1;
    self.BtnAddMore.hidden=NO;
    [self setaddmoreButton];
    self.snowlogformtoAdd = [[AddSnowLogRequest alloc]init];

    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    
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
-(void)setaddmoreButton{
 
    if(employeecount==1){
        
        self.BtnAddMore.frame=CGRectMake(self.view.frame.size.width-self.BtnAddMore.frame.size.width-10, self.ViewEmployeeName1.frame.origin.y+self.ViewEmployeeName1.frame.size.height+10, self.BtnAddMore.frame.size.width, self.BtnAddMore.frame.size.height);
    }
    else if(employeecount==2){
        
        self.BtnAddMore.frame=CGRectMake(self.view.frame.size.width-self.BtnAddMore.frame.size.width-10, self.ViewEmployeeName2.frame.origin.y+self.ViewEmployeeName2.frame.size.height+10, self.BtnAddMore.frame.size.width, self.BtnAddMore.frame.size.height);
    }
    else if(employeecount==3){
        
        self.BtnAddMore.frame=CGRectMake(self.view.frame.size.width-self.BtnAddMore.frame.size.width-10, self.ViewEmployeeName3.frame.origin.y+self.ViewEmployeeName3.frame.size.height+10, self.BtnAddMore.frame.size.width, self.BtnAddMore.frame.size.height);
    }
    else if(employeecount==4){
        
        self.BtnAddMore.frame=CGRectMake(self.view.frame.size.width-self.BtnAddMore.frame.size.width-10, self.ViewEmployeeName4.frame.origin.y+self.ViewEmployeeName4.frame.size.height+10, self.BtnAddMore.frame.size.width, self.BtnAddMore.frame.size.height);
    }
    else if(employeecount==5){
        
        self.BtnAddMore.frame=CGRectMake(self.view.frame.size.width-self.BtnAddMore.frame.size.width-10, self.ViewEmployeeName5.frame.origin.y+self.ViewEmployeeName5.frame.size.height+10, self.BtnAddMore.frame.size.width, self.BtnAddMore.frame.size.height);
    }
    
    self.BtnAccachPhoto.frame=CGRectMake(self.view.frame.size.width-self.BtnAccachPhoto.frame.size.width-10, self.BtnAddMore.frame.origin.y+self.BtnAddMore.frame.size.height+10, self.BtnAccachPhoto.frame.size.width, self.BtnAccachPhoto.frame.size.height);
    self.BtnNext.frame=CGRectMake((self.view.frame.size.width-self.BtnNext.frame.size.width)/2, self.BtnAccachPhoto.frame.origin.y+self.BtnAccachPhoto.frame.size.height+30, self.BtnNext.frame.size.width, self.BtnNext.frame.size.height);
  //  self.BtnNext.center=self.ScrollView.center;
    [self setScrollViewSize];

}

- (IBAction)AddMoreEmployee:(id)sender {
    
    if(employeecount==1){
        employeecount=employeecount+1;
        self.ViewEmployeeName2.hidden=NO;
    }
    else if(employeecount==2){
        employeecount=employeecount+1;
        self.ViewEmployeeName3.hidden=NO;
    }
    else if(employeecount==3){
        employeecount=employeecount+1;
        self.ViewEmployeeName4.hidden=NO;
    }
    else if(employeecount==4){
        employeecount=employeecount+1;
        self.ViewEmployeeName5.hidden=NO;
        self.BtnAddMore.hidden=YES;
    }
    [self setaddmoreButton];
}
-(void)getAllProperty{
    
    [self startLoading];
    
    
    [[WebServiceManager sharedInstance]GetPropertyListWithSuccess:^(SLBaseResponse *result) {
        
        [self stopLoading];
        
        GetPropertyListResponse *response = (GetPropertyListResponse *)result;
        if (response.result.count) {
            self.arrProperty = [[NSArray alloc]initWithArray:response.result];
            [self showSelectionVCForOpponents];
        }
        else{
            
            [self showToastForText:@"No Property Found"];
            
        }
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Cannot fetch Property. Please try again"];
    }];
    
}
- (IBAction)AttachPhoto:(id)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped do nothing.
        [actionSheet dismissViewControllerAnimated:YES completion:^{
            
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // take photo button tapped.
        [self takeVideo];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Choose Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // choose photo button tapped.
        [self choosePhoto];
        
    }]];
    
    
    actionSheet.popoverPresentationController.sourceView = self.view;
    actionSheet.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    
    [actionSheet showViewController:self sender:actionSheet];
    
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];

}
-(void)takeVideo{
    
    
    
    
        UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
        [libraryPicker setDelegate:self];
        [libraryPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    
    
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self.parentViewController presentViewController:libraryPicker animated:YES completion:^{
            
        }];
  }];
    
        
    
    
    
    
    
}

-(void)choosePhoto{
    
    
    
        UIImagePickerController *libraryPicker = [[UIImagePickerController alloc] init];
        [libraryPicker setDelegate:self];
        [libraryPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self presentViewController:libraryPicker animated:YES completion:^{
            
        }];    }];
    
    
        
        
    
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
        
        
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        if(!img) img = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    
        [self.arrImages addObject:[self encodeToBase64String:img]];
        
        [self SetImages];
        [self dismissViewControllerAnimated:picker completion:^{
            
        }];
    
    
    //    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
}
-(void)SetImages{
    
    
    if(!scrolimages){
    }
    else
    {
        [scrolimages removeFromSuperview];
    }
    scrolimages=[[UIScrollView alloc]init];
    
    float startx = (self.ScrollView.frame.size.width-20)/4;
    float starty = 10;

    float startxspace = startx/4;
    float startxspace1 = startx/4;

    scrolimages.frame=CGRectMake(10,self.BtnAccachPhoto.frame.origin.y+self.BtnAccachPhoto.frame.size.height+10,self.ScrollView.frame.size.width-10,startx+20);

    int count = 0;
    for(NSString *s in self.arrImages){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(startxspace+startx-7,starty-7, 15, 15);
        [btn setImage:[UIImage imageNamed:@"close-bt"] forState:UIControlStateNormal];
        btn.tag=count;
        [btn addTarget:self action:@selector(DeleteImage:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIImageView *img = [[UIImageView alloc]init];
        img.frame= CGRectMake(startxspace,starty, startx, startx);
        img.image=[self decodeBase64ToImage:s];
        [scrolimages addSubview:img];
        [scrolimages addSubview:btn];

        startxspace= startxspace + startx + startxspace1;

        count++;
        
    }
    scrolimages.showsVerticalScrollIndicator=YES;
    [self.ScrollView addSubview:scrolimages];
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrolimages.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    scrolimages.contentSize = contentRect.size;

    if([self.arrImages count]<2){
    [self setScrollViewSize];
    }
    if([self.arrImages count]>4){
        self.BtnAccachPhoto.hidden=YES;
    }
    else{
        self.BtnAccachPhoto.hidden=NO;

    }
    
    self.BtnNext.frame=CGRectMake((self.view.frame.size.width-self.BtnNext.frame.size.width)/2,scrolimages.frame.origin.y+scrolimages.frame.size.height+10, self.BtnNext.frame.size.width, self.BtnNext.frame.size.height);

    
    
}
-(void)DeleteImage:(id)sender{
    
    UIButton *b = (UIButton*)sender;
    [self.arrImages removeObjectAtIndex:b.tag];
    [self SetImages];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:picker completion:^{
        
    }];
    //    [[picker presentingViewController] dismissModalViewControllerAnimated:YES];
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImageJPEGRepresentation(image, 0.3) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
-(UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}
-(void)showSelectionVCForOpponents{
    
    
    SLSelectionViewController *aWSelectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SLSelectionViewController"];
    
    
    aWSelectionViewController.itemList = self.arrProperty;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"building"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Property";
        [self presentViewController:aWSelectionViewController animated:YES completion:nil];
        
        
    
    
    
    
}

 #pragma mark - Navigation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    
#if TARGET_IPHONE_SIMULATOR
    
    // Simulator specific code
    return YES;

    
#else // TARGET_IPHONE_SIMULATOR
    
    // Device specific code
    
    
    
    
    if([identifier isEqualToString:@"GoToNextView"]){
        
        if(self.TxtDate.text.length){

        if(self.TxtProperty.text.length){
            
            if(self.TxtEmployee1.text.length){
                
                return YES;

            }
            else
            {
                [self showToastForText:@"Please Enter Employee Name"];
                return NO;


            }
        }
        else
        {
            [self showToastForText:@"Please Select Property"];

            return NO;

        }
        }
        else
        {
            [self showToastForText:@"Please Select Date"];
            
            return NO;
        }
    }
    else
    {
        return NO;
    }
#endif // TARGET_IPHONE_SIMULATOR

    
}
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if([segue.identifier isEqualToString:@"GoToNextView"]){
         
         
         ViewController1 *view2 = segue.destinationViewController;
         self.snowlogformtoAdd.form_date=self.DATEYYMMDD;
         self.snowlogformtoAdd.property_name=self.TxtProperty.text;
         self.snowlogformtoAdd.employee_name1=self.TxtEmployee1.text;
         self.snowlogformtoAdd.employee_name2=self.TxtEmployee2.text;
         self.snowlogformtoAdd.employee_name3=self.TxtEmployee3.text;
         self.snowlogformtoAdd.employee_name4=self.TxtEmployee4.text;
         self.snowlogformtoAdd.employee_name5=self.TxtEmployee5.text;
         view2.snowlogformtoAdd1=self.snowlogformtoAdd;
        // view2.arrImages=self.arrImages;

         
     }
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.

    if([textField isEqual:self.TxtProperty]){
        
        
        if(self.arrProperty.count){
            
            [self showSelectionVCForOpponents];

        }
        else
        {
            [self getAllProperty];

        }
        
        return NO;
    }
    else if([textField isEqual:self.TxtDate]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    else {
        
        return YES;
    }
}
-(void)ShowDatePicker
{
    DatePickerViewController *dpvc = [[DatePickerViewController alloc] init];
    [dpvc setDelegate:self];
    [dpvc setTitle:@"Select Date"];
    UINavigationController *navDpvc = [[UINavigationController alloc] initWithRootViewController:dpvc];
    [navDpvc.navigationBar setTintColor:[UIColor blackColor]];
    [navDpvc setModalPresentationStyle:UIModalPresentationFormSheet];
    [navDpvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navDpvc animated:YES completion:nil];

}
#pragma mark will handle dismissal for datepicker

- (void)DatePickerViewControllerDidFinish:(DatePickerViewController *)controller
{
    //fetch datepicker value from controller object
   NSDateFormatter  *dateofbirthformat = [[NSDateFormatter alloc] init];
    [dateofbirthformat setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat setDateFormat:@"MM-dd-yyyy"];
    self.TxtDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
    
    
    NSDateFormatter *dateofbirthformat1 = [[NSDateFormatter alloc] init];
    [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
    self.DATEYYMMDD = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)didSelectItem:(SLBaseModel *)selectedItem{
    
    
        Property *opponent = (Property *)selectedItem;
        
        self.TxtProperty.text = opponent.building;
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}


@end

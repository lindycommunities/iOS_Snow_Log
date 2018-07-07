//
//  ViewController.m
//  Snow Log
//
//  Created by S S D on 18/03/17.
//  Copyright © 2017 Snow Log. All rights reserved.
//

#import "ViewController2.h"
#import "GetPropertyListResponse.h"

@interface ViewController2(){
    AddSnowLogImageRequest *snowlogformtoAdd;

}
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (strong, nonatomic) IBOutlet UITextField *TxtTimeIn;
@property (strong, nonatomic) IBOutlet UITextField *TxtTimeOut;
@property (strong, nonatomic)  UITextField *ActiveTextfield;

@property (strong, nonatomic) IBOutlet UITextField *TxtBaseConcrete;
@property (strong, nonatomic) IBOutlet UIView *ViewBaseConcreteReason;
@property (strong, nonatomic) IBOutlet UIView *ViewOtherNote;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *BaseConcreteReasongHeight;
@property (strong, nonatomic) IBOutlet UITextView *TxtBaseConcreteReason;
@property (strong, nonatomic) IBOutlet UITextView *TxtOtherNote;
@property (strong, nonatomic) IBOutlet UIButton *BtnSubmit;
@property (strong, nonatomic) IBOutlet UIButton *BtnAccachPhoto;


- (IBAction)Submit:(id)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *SetYPos;

@end

@implementation ViewController2
@synthesize snowlogformtoAdd2;
@synthesize form_id;
@synthesize arrImages;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TxtTimeIn.text=self.snowlogformtoAdd2.time_in;
    self.TxtTimeOut.text=self.snowlogformtoAdd2.time_out;
    self.TxtBaseConcrete.text=self.snowlogformtoAdd2.base_concrete;
    self.TxtBaseConcreteReason.text=self.snowlogformtoAdd2.base_concrete_reason;
    self.TxtOtherNote.text=self.snowlogformtoAdd2.other_notes;
    
    if([self.TxtBaseConcrete.text isEqualToString:@"No"]){
        
        [self showContainer];
        
    }
    else
    {
        [self hideContainer];
        
        
    }

    if(!self.arrImages){
    self.arrImages=[[NSMutableArray alloc]init];
        [self SetImages];
    }
    else
    {
        [self SetImages];
    }
    [self setScrollViewSize];
    
    _dropdown = [[VSDropdown alloc]initWithDelegate:self];
    // [_dropdown setAdoptParentTheme:YES];
    [_dropdown setShouldSortItems:NO];
    
   // [self hideContainer];
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView2) name:@"ScanCompleted2" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)updateView2{
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    
    
}
-(void) showContainer
{
//    self.BaseConcreteReasongHeight.active = NO;
    self.ViewBaseConcreteReason.hidden = NO;
//    self.BaseConcreteReasongHeight.constant = 120.0f;
    self.SetYPos.active = YES;

    self.SetYPos.constant=140.0f;
    [self.view layoutIfNeeded];
}
-(void) hideContainer
{
//    self.BaseConcreteReasongHeight.active = YES;
//    self.BaseConcreteReasongHeight.constant = 0.0f;
    self.ViewBaseConcreteReason.hidden = YES;
    self.SetYPos.active = YES;

    self.SetYPos.constant=10.0f;
    

    [self.view layoutIfNeeded];
}
-(void)setScrollViewSize{
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.ScrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    contentRect = CGRectUnion(contentRect, self.BtnSubmit.frame);
    contentRect = CGRectUnion(contentRect, self.BtnSubmit.frame);
    contentRect = CGRectUnion(contentRect, self.BtnSubmit.frame);
    contentRect = CGRectUnion(contentRect, self.BtnSubmit.frame);
    self.ScrollView.contentSize = contentRect.size;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
//    aWSelectionViewController.itemList = self.arrProperty;//arrLevels; //list to display
        aWSelectionViewController.displayItemKey = @"building"; //key of value to display
        //   aWSelectionViewController.subtitleDisplayItemKey =@"";// @"coachID"; //key of value to display
        aWSelectionViewController.delegate  = self;
        aWSelectionViewController.titleForSelection = @"Select Property";
        [self presentViewController:aWSelectionViewController animated:YES completion:nil];
        
        
    
    
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.

    self.ActiveTextfield=textField;
    if([textField isEqual:self.TxtTimeIn]){
    
        
        [self ShowDatePicker];
        return NO;
    }
    else if([textField isEqual:self.TxtTimeOut]){
        
        
        [self ShowDatePicker];
        return NO;
    }
    
    else if([textField isEqual:self.TxtBaseConcrete]){
        
        
        [self showDropDownForButton:textField adContents:@[@"Yes",@"No"] multipleSelection:NO];
        return NO;
    }
    
    

    
    else {
    
        return YES;
    }
}
-(void)showDropDownForButton:(UITextField *)sender adContents:(NSArray *)contents multipleSelection:(BOOL)multipleSelection
{
    
    [_dropdown setDrodownAnimation:rand()%2];
    
    [_dropdown setAllowMultipleSelection:multipleSelection];
    
    //  [_dropdown setupDropdownForView:sender];
    
    [_dropdown setupDropdownForView:sender direction:VSDropdownDirection_Down withTopColor:[UIColor whiteColor] bottomColor:[UIColor whiteColor] scale:1.0];
    
    [_dropdown setSeparatorColor:sender.textColor];
    
    if (_dropdown.allowMultipleSelection)
    {
        
    }
    else
    {
        [_dropdown reloadDropdownWithContents:contents andSelectedItems:@[sender.text]];
        
    }
    
}
#pragma mark -
#pragma mark - VSDropdown Delegate methods.
- (void)dropdown:(VSDropdown *)dropDown didChangeSelectionForValue:(NSString *)str atIndex:(NSUInteger)index selected:(BOOL)selected
{
    UITextField *btn = (UITextField *)dropDown.dropDownView;
    
    btn.text = [dropDown.selectedItems firstObject];
    
    if([btn.text isEqualToString:@"Yes"]){
        
        [self hideContainer];

    }
    else
    {
        [self showContainer];

    }
    [self SetImages];

//    if([btn isEqual:self.TxtBaseConcrete]){
//        
//    }
    
    
    
}

-(void)didSelectItem:(SLBaseModel *)selectedItem{
    
    
        Property *opponent = (Property *)selectedItem;
    
       // self.TxtProperty.text = opponent.building;
    
    
    
    // matchNoteToAdd.opponent = opponent.displayName;
}
-(void)ShowDatePicker
{
    DatePickerViewController *dpvc = [[DatePickerViewController alloc] init];
    [dpvc setDelegate:self];
    [dpvc setTitle:@"Select Time"];
    dpvc.isTimeView=YES;
    UINavigationController *navDpvc = [[UINavigationController alloc] initWithRootViewController:dpvc];
    [navDpvc.navigationBar setTintColor:[UIColor blackColor]];
//    [navDpvc setModalPresentationStyle:UIModalPresentationFormSheet];
//    [navDpvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navDpvc animated:YES completion:nil];
    
    
    
}
#pragma mark will handle dismissal for datepicker

- (void)DatePickerViewControllerDidFinish:(DatePickerViewController *)controller
{
    //fetch datepicker value from controller object
    NSDateFormatter  *dateofbirthformat = [[NSDateFormatter alloc] init];
    [dateofbirthformat setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat setDateFormat:@"HH:mm"];
    
    
    if([self.ActiveTextfield isEqual:self.TxtTimeIn]){
        
        
        self.TxtTimeIn.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
    }
    else if([self.ActiveTextfield isEqual:self.TxtTimeOut]){
        
        
        self.TxtTimeOut.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
    }
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Submit:(id)sender {
    [self startLoading];
    self.snowlogformtoAdd2.time_in=self.TxtTimeIn.text;
    self.snowlogformtoAdd2.time_out=self.TxtTimeOut.text;
    self.snowlogformtoAdd2.base_concrete=self.TxtBaseConcrete.text;
    self.snowlogformtoAdd2.base_concrete_reason=self.TxtBaseConcreteReason.text;
    self.snowlogformtoAdd2.other_notes=self.TxtOtherNote.text;

    if(self.arrImages.count){
     
        self.snowlogformtoAdd2.islast_flag=@"no";


    }
    else
    {
        self.snowlogformtoAdd2.islast_flag=@"yes";

    }

    
    

    [[WebServiceManager sharedInstance]AddSnowLogFormForRequest:self.snowlogformtoAdd2 success:^(SLBaseResponse *result) {
        
        GetSnowLogResponse *resp = (GetSnowLogResponse*)result;
        self.form_id=resp.form_id;
        NSLog(@"FORM %@ %@",self.form_id,resp.form_id);
        
        if(self.arrImages.count){
            
            [self UpoadImages];
            
        }
        else
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted1" object:nil];
           // [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted2" object:nil];
            self.snowlogformtoAdd2=nil;
            self.TxtTimeIn.text=nil;
            self.TxtTimeOut.text=nil;
            self.TxtBaseConcrete.text=nil;
            self.TxtBaseConcreteReason.text=nil;
            self.TxtOtherNote.text=nil;
            self.arrImages=nil;

            
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            [self stopLoading];
            
            [self showToastForText:@"Success!"];

        }
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];

        [self showToastForText:@"Could not save data at the moment"];
    }];
}
-(void)UpoadImages{
    snowlogformtoAdd=[[AddSnowLogImageRequest alloc]init];
    snowlogformtoAdd.image_base64=[self.arrImages objectAtIndex:0];
    if(self.arrImages.count==1){
        snowlogformtoAdd.islast_flag=@"yes";
    }
    else
    {
        snowlogformtoAdd.islast_flag=@"no";

    }
    snowlogformtoAdd.form_id=self.form_id;
    [[WebServiceManager sharedInstance]AddSnowLogFormImagesForRequest:snowlogformtoAdd success:^(SLBaseResponse *result) {
        
        [self.arrImages removeObjectAtIndex:0];
        if(self.arrImages.count){
            
            [self UpoadImages];
            
        }
        else
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted1" object:nil];
            //[[NSNotificationCenter defaultCenter] postNotificationName:@"ScanCompleted2" object:nil];
            self.snowlogformtoAdd2=nil;
            self.TxtTimeIn.text=nil;
            self.TxtTimeOut.text=nil;
            self.TxtBaseConcrete.text=nil;
            self.TxtBaseConcreteReason.text=nil;
            self.TxtOtherNote.text=nil;
            self.arrImages=nil;


            [self.navigationController popToRootViewControllerAnimated:YES];
            [self stopLoading];
            
            [self showToastForText:@"Success!"];
            
        }
        
        
    } failure:^(CustomError *error) {
        [self stopLoading];
        
        [self showToastForText:@"Could not save data at the moment"];
    }];

    
}
- (IBAction)back_BtnPressed:(id)sender{
    
    self.snowlogformtoAdd2.time_in=self.TxtTimeIn.text;
    self.snowlogformtoAdd2.time_out=self.TxtTimeOut.text;
    self.snowlogformtoAdd2.base_concrete=self.TxtBaseConcrete.text;
    self.snowlogformtoAdd2.base_concrete_reason=self.TxtBaseConcreteReason.text;
    self.snowlogformtoAdd2.other_notes=self.TxtOtherNote.text;
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    
    
    if(!(img.imageOrientation == UIImageOrientationUp ||
         img.imageOrientation == UIImageOrientationUpMirrored))
    {
        CGSize imgsize = img.size;
        UIGraphicsBeginImageContext(imgsize);
        [img drawInRect:CGRectMake(0.0, 0.0, imgsize.width, imgsize.height)];
        img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    
    
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
    if([self.arrImages count]>0){

    [self.ScrollView addSubview:scrolimages];
    }
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrolimages.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    scrolimages.contentSize = contentRect.size;
    
    
    if([self.arrImages count]>4){
        self.BtnAccachPhoto.hidden=YES;
    }
    else{
        self.BtnAccachPhoto.hidden=NO;
        
    }
    if([self.arrImages count]>0){
        self.BtnSubmit.frame=CGRectMake((self.view.frame.size.width-self.BtnSubmit.frame.size.width)/2,scrolimages.frame.origin.y+scrolimages.frame.size.height+30, self.BtnSubmit.frame.size.width, self.BtnSubmit.frame.size.height);
    }
    else{
        self.BtnSubmit.frame=CGRectMake((self.view.frame.size.width-self.BtnSubmit.frame.size.width)/2,self.BtnAccachPhoto.frame.origin.y+self.BtnAccachPhoto.frame.size.height+80, self.BtnSubmit.frame.size.width, self.BtnSubmit.frame.size.height);
        
    }

    
    
    if([self.arrImages count]<2){
        [self setScrollViewSize];
    }
    
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

@end

//
//  ViewController.h
//  Snow Log
//
//  Created by S S D on 18/03/17.
//  Copyright © 2017 Snow Log. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SLSelectionViewController.h"
#import "DatePickerViewController.h"
#import "VSDropdown.h"

@interface ViewController2 : BaseViewController<SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate,VSDropdownDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    VSDropdown *_dropdown;
    AddSnowLogRequest *snowlogformtoAdd2;
    UIScrollView *scrolimages;

    
}
@property(nonatomic,retain)AddSnowLogRequest *snowlogformtoAdd2;
@property(nonatomic,retain)NSString *form_id;
@property(nonnull,retain)NSMutableArray *arrImages;
- (IBAction)AttachPhoto:(id)sender;



@end


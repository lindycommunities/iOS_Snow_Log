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

@interface ViewController : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,SLSelectionDelegate,UITextFieldDelegate,DatePickerViewControllerDelegate>{
UIScrollView *scrolimages;
}

@end


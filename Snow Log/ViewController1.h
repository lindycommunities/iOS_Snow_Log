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

@interface ViewController1 : BaseViewController<SLSelectionDelegate,UITextFieldDelegate>{
    
    AddSnowLogRequest *snowlogformtoAdd1;

}
@property(nonatomic,retain)AddSnowLogRequest *snowlogformtoAdd1;
@property(nonnull,retain)NSMutableArray *arrImages;
- (IBAction)back_BtnPressed:(id)sender;
@property (nonatomic, strong) NSMutableDictionary *selectedIndexDictionary;
@property (nonatomic, strong) NSMutableArray *selectedIndexValue;

@end


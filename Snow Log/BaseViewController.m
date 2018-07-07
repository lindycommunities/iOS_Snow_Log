//
//  BaseViewController.m
//  Level7Tennis
//
//  Created by Bonnie Jaiswal on 12/10/16.
//  Copyright © 2016 Bonnie Jaiswal. All rights reserved.
//

#import "BaseViewController.h"
#import "KSToastView.h"
#import "MBProgressHud.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupMenuBarButtonItems];
//    
//    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Navlogo.png"]];
//    self.navigationItem.titleView = img;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    if(!self.navigationItem.titleView){
//        self.navigationItem.titleView = ({
//            UILabel *titleView = [UILabel new];
//            titleView.numberOfLines = 0;
//            titleView.textAlignment = NSTextAlignmentCenter;
//            titleView.attributedText = [[NSAttributedString alloc] initWithString:@"SPORTS\nAcademy" attributes:
//                                        self.navigationController.navigationBar.titleTextAttributes
//                                        ];
//            
//            [titleView sizeToFit];
//            // You'll need to set your frame otherwise if your line breaks aren't explcit.
//            
//            titleView;
//        });
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)startLoading{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)stopLoading{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)showToastForText:(NSString *)text{

    [KSToastView ks_showToast:text duration:3];
}


- (void)setupMenuBarButtonItems {
    
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-bt"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"logout-bt"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}

- (void)leftSideMenuButtonPressed:(id)sender {
//    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
//        //        [self setupMenuBarButtonItems];
//    }];
}

- (void)rightSideMenuButtonPressed:(id)sender {

    // do logout
        
    UINavigationController *loginNavCOntroller = [self.storyboard instantiateViewControllerWithIdentifier:@"loginNavigationController"];

    [self.view.window setRootViewController:loginNavCOntroller];
}

- (IBAction)backBtnPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end

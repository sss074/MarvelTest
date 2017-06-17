//
//  SBBaseController.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBBaseController.h"

@interface SBBaseController ()

@end

@implementation SBBaseController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    self.navigationItem.title = @"";
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    
}

#pragma mark - Service methods

- (void)setupNavBtn:(NavBarType)type{
    
    UIButton *btn = nil;
    UIImage *btnImg  = nil;
    UIBarButtonItem *barBtnItem = nil;
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
    
    switch (type) {
        
        case BACKTYPE: {
            btnImg = [UIImage imageNamed:@"icBack"];
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0.f, 0.f, btnImg.size.width, btnImg.size.height);
            [btn setImage:btnImg forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnBackPressed) forControlEvents:UIControlEventTouchUpInside];
            barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            self.navigationItem.leftBarButtonItem = barBtnItem;
            [barBtnItem release];
            
        }
            break;
       
        default:
            break;
    }
}
#pragma mark - Action methods

- (void)btnBackPressed{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

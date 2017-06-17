//
//  SBBaseController.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBBaseController : UIViewController

@property (nonatomic,strong) UILabel *titleLabel;
- (void)setupNavBtn:(NavBarType)type;
- (void)simpleTitle:(NSString*)title;
- (void)btnBackPressed;

@end

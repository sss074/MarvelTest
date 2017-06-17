//
//  SBNavigationController.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBNavigationController.h"

@interface SBNavigationController ()

@end

@implementation SBNavigationController

- (BOOL)shouldAutorotate{
    
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

@end

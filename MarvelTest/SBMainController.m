//
//  ViewController.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBMainController.h"
#import "SBMainView.h"
#import "SBDetailController.h"

@interface SBMainController () <SBMainViewDelegate>

@property (nonatomic, strong) IBOutlet SBMainView* mainView;

@end

@implementation SBMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [[SBManager sharedManager]characters:^(NSArray<SBCharacters *> *obj) {
        NSLog(@"%@", obj);
        dispatch_async(dispatch_get_main_queue(), ^{
            _mainView.content = [NSArray arrayWithArray:obj];
            _mainView.delegete = self;
        });
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Marvel characters";

}

- (void)dealloc{
    
    [_mainView release];
 
    [super dealloc];
}

#pragma mark - SBMainView delegate methods

- (void)didSelectItem:(SBMainView*)view withContent:(SBCharacters*)obj{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SBDetailController* controller = [storyboard instantiateViewControllerWithIdentifier:@"DetailController"];
    controller.content = obj;
    [self.navigationController pushViewController:controller animated:YES];
    
}

@end

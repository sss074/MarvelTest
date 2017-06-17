//
//  SBDetailController.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBDetailController.h"
#import "SBDetailView.h"

@interface SBDetailController ()

@property (nonatomic, strong) IBOutlet SBDetailView* detailView;

@end

@implementation SBDetailController

@synthesize content = _content;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = _content.name;
    [self setupNavBtn:BACKTYPE];
    [_content retain];
    _detailView.content = _content;
}
- (void)dealloc{
    
    [_content release];
    [_detailView release];
    
    [super dealloc];
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)_detailView.collectionView.collectionViewLayout;
    [layout invalidateLayout];
}

@end

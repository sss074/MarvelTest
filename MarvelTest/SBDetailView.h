//
//  SBDetailView.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDetailView : UIView

@property(nonatomic, strong) SBCharacters* content;
@property (nonatomic,strong) IBOutlet UICollectionView* collectionView;

@end

//
//  SBMainView.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBMainView;

@protocol SBMainViewDelegate <NSObject>

- (void)didSelectItem:(SBMainView*)view withContent:(SBCharacters*)obj;

@end

@interface SBMainView : UIView

@property(nonatomic, strong) NSArray<SBCharacters*>* content;
@property(nonatomic,assign) id<SBMainViewDelegate> delegete;

@end

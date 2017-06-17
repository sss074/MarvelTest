//
//  SBDetailView.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBDetailView.h"
#import "SBDetailCell.h"

@interface SBDetailView () <UICollectionViewDataSource,UICollectionViewDelegate>



@end

@implementation SBDetailView

- (void)setContent:(SBCharacters *)content{
    _content = content;
    [_content retain];
    [_collectionView reloadData];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

#pragma mark - UICollectionView layout delegate


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}
#pragma mark - UICollectionView datasourse

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"DetailCell";
    SBDetailCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.content = _content;
    return cell;
    
}
#pragma mark - UICollectionView delegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize size = [self sizeWithText:_content.descriptions width:CGRectGetWidth([UIScreen mainScreen].bounds) - 40.f font:[UIFont fontWithName:DETAILFONT size:18.f]];
    CGFloat addY = CGRectGetWidth([UIScreen mainScreen].bounds) - 40.f + 90.f;
    return CGSizeMake(CGRectGetWidth(_collectionView.frame), size.height + addY);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


- (void)dealloc{
    
    [_content release];
    [_collectionView release];
    
    [super dealloc];
}
@end

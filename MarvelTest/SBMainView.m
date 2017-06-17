//
//  SBMainView.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBMainView.h"
#import "SBCharacterListCell.h"

#define ADDHIGHT 70

@interface SBMainView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@end

@implementation SBMainView

@synthesize content = _content;

- (void)setContent:(NSArray *)content{
    _content = content;
    [_content retain];
    if(_content != nil){
        [_tableView setHidden:NO];
        [_tableView reloadData];
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [_tableView setHidden:YES];
}
- (void)dealloc{
 
    [_content release];
    [_tableView release];
    
    [super dealloc];
}

#pragma  mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _content.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CharacterListCell";
    
    SBCharacterListCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(_content != nil)
        cell.content = _content[indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma  mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SBCharacters* obj = _content[indexPath.row];
    
    CGSize size = [self sizeWithText:obj.descriptions width:CGRectGetWidth([UIScreen mainScreen].bounds) - 110.f font:[UIFont fontWithName:DETAILFONT size:14.f]];
    
    return size.height + ADDHIGHT;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
 
    if([_delegete respondsToSelector:@selector(didSelectItem:withContent:)]){
        [_delegete didSelectItem:self withContent:_content[indexPath.row]];
    }
}

@end

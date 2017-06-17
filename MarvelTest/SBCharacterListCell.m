//
//  SBCharacterListCell.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBCharacterListCell.h"

@interface SBCharacterListCell ()

@property (nonatomic, strong) IBOutlet UIImageView* imgView;
@property (nonatomic, strong) IBOutlet UILabel* title;
@property (nonatomic, strong) IBOutlet UILabel* detail;

@end

@implementation SBCharacterListCell

- (void)setContent:(SBCharacters *)content{
    _content = content;
    
    if(_content != nil){
        [_imgView sd_setImageWithURL:[NSURL URLWithString:_content.imageURL] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if(image != nil){
                [_imgView setImage:image];
            }
        }];
        
        _title.text = _content.name;
        _detail.text = _content.descriptions;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)dealloc{

    [_content release];
    [_imgView release];
    [_title release];
    [_detail release];
    
    [super dealloc];
}

@end

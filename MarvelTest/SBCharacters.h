//
//  SBCharacters.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBBaseDataModel.h"

@interface SBCharacters : SBBaseDataModel <NSCoding>

@property (nonatomic,strong) NSNumber* ID;
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* descriptions;
@property (nonatomic,strong) NSString* imageURL;


@end

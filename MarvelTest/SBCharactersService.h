//
//  SBCharactersService.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBObjectManager.h"
#import "SBCharacters.h"

@interface SBCharactersService : SBObjectManager

- (void) characters:(void (^)(NSArray<SBCharacters*>* obj))success failure:(void (^)(NSError *error))failure;

@end

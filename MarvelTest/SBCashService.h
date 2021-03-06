//
//  SBCashService.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBCharacters.h"

@interface SBCashService : NSObject

- (void)insertItemsCash:(NSArray<SBCharacters*>*) obj success:(void (^)(void))success;
- (void)itemsCash:(void (^)(NSArray<SBCharacters*>* obj))success;

@end

//
//  SBManager.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBCharacters.h"

@interface SBManager : NSObject

+ (instancetype) sharedManager;
- (void) characters:(void (^)(NSArray<SBCharacters*>* obj))success;
- (void)insertItemsCash:(NSArray<SBCharacters*>*) obj success:(void (^)(void))success;
- (void)itemsCash:(void (^)(NSArray<SBCharacters*>* obj))success;

@end

//
//  SBManager.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBManager.h"
#import "SBCharactersService.h"
#import "SBCashService.h"

static SBManager *sharedManager = nil;

@implementation SBManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SBManager alloc]init];
    });
    
    return sharedManager;
}

- (void) characters:(void (^)(NSArray<SBCharacters*>* obj))success{
    
    SBCharactersService* service = [[SBCharactersService alloc]init];
    
    [service characters:^(NSArray<SBCharacters *> *obj){
        if(success)
            success(obj);
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showAlertMessage:error.description];
        });
    }];
    
    [service release];
}
- (void)insertItemsCash:(NSArray<SBCharacters*>*) obj success:(void (^)(void))success{
    SBCashService* service = [[SBCashService alloc]init];
    
    [service insertItemsCash:obj success:^{
        if(success)
            success();
    }];
    
    [service release];
}
- (void)itemsCash:(void (^)(NSArray<SBCharacters*>* obj))success{
    SBCashService* service = [[SBCashService alloc]init];
    
    [service itemsCash:^(NSArray<SBCharacters *> *obj) {
        if(success)
            success(obj);
    }];
    
    [service release];
}
@end

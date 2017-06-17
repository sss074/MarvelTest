//
//  SBManager.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBManager.h"
#import "SBCharactersService.h"

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
}
@end

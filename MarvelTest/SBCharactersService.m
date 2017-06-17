 //
//  SBCharactersService.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBCharactersService.h"

@implementation SBCharactersService

- (void) characters:(void (^)(NSArray<SBCharacters*>* obj))success failure:(void (^)(NSError *error))failure {
   
    if (![self connected]) {
        [[SBCashService sharedManager] itemsCash:^(NSArray<SBCharacters *> *obj) {
            NSLog(@"%@", obj);
            dispatch_async(dispatch_get_main_queue(), ^{
                if(obj == nil){
                    [self showAlertMessage:@"There is no connection to the Internet"];
                } else {
                    if (success) {
                        success([NSArray arrayWithArray:obj]);
                    }
                }
            });
        }];
    } else {
        [self showIndecator:YES];
        [[[NSURLSession sharedSession] dataTaskWithRequest:[self setupGetRequestDescriptors:[SBCharacters pathPattern]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
             NSInteger statusCode =  [self checkStatusCode:response];
            if (error){
                [self showIndecator:NO];
                if(statusCode != INVALID){
                    if (failure) {
                        failure(error);
                    }
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showIndecator:NO];
                    if(statusCode == SUCCSESS){
                        
                        NSMutableArray* temp = [[[NSMutableArray alloc]init]autorelease];
                        NSDictionary* result = [self setupResponseDescriptors:data];
                        NSDictionary* data = result[@"data"];
                        NSArray* results  = [NSArray arrayWithArray:data[@"results"]];
                        for (int i = 0; i < results.count; i++){
                            NSDictionary* item = results[i];
                            
                            SBCharacters* itemCharacter = [[SBCharacters alloc]init];
                            itemCharacter.ID = item[@"id"];
                            itemCharacter.name = item[@"name"];
                            NSString* descr = item[@"description"];
                            itemCharacter.descriptions = [descr isEqualToString:@""] ? @"Empty description" : descr;
                            NSDictionary* thumbnail = item[@"thumbnail"];
                            itemCharacter.imageURL = [NSString stringWithFormat:@"%@.%@",thumbnail[@"path"],thumbnail[@"extension"]];
                            [temp addObject:itemCharacter];
                            [itemCharacter release];
                           
                        }
                        [[SBCashService sharedManager]insertItemsCash:[NSArray arrayWithArray:temp] success:nil];
                        
                        if (success) {
                            success([NSArray arrayWithArray:temp]);
                        }
                    }
                });
            }
            
        }]resume];
    }

}

@end

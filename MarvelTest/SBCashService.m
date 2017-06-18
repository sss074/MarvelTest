//
//  SBCashService.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBCashService.h"


@implementation SBCashService


- (void)insertItemsCash:(NSArray<SBCharacters*>*) obj success:(void (^)(void))success{
    
    NSError  *error;
    NSString* filePath = [self documentsPathForFileName:@"cash.json"];

    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
    }
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    NSData* archiveData = [NSKeyedArchiver archivedDataWithRootObject:[NSArray arrayWithArray:obj]];
    [archiveData writeToFile:filePath options:NSDataWritingAtomic error:&error];
    
    if(success)
        success();
}
- (void)itemsCash:(void (^)(NSArray<SBCharacters*>* obj))success{
    
    NSString* filePath = [self documentsPathForFileName:@"cash.json"];
    
    NSArray* items = nil;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *archiveData = [NSData dataWithContentsOfFile:filePath];
        items = (NSArray*)[NSKeyedUnarchiver unarchiveObjectWithData:archiveData];
    }
    
    if(success)
        success(items);
}


@end

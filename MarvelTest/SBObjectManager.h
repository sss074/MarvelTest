//
//  SBObjectManager.h
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface SBObjectManager : NSObject

- (NSMutableURLRequest*) setupGetRequestDescriptors:(NSString*)path;
- (id) setupResponseDescriptors:(NSData*)data;
- (NSInteger)checkStatusCode:(NSURLResponse *)response;
- (BOOL)connected;

@end

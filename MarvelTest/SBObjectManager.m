//
//  SBObjectManager.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBObjectManager.h"

@implementation SBObjectManager

- (BOOL)connected{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

- (NSMutableURLRequest*) setupGetRequestDescriptors:(NSString*)path{
    NSDictionary * param = [self authParams];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@",kDevBaseApiUrl,path,param[@"ts"],kAPIPublicKey,param[@"hash"]]]]autorelease];

    NSLog(@"%@",[NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@",kDevBaseApiUrl,path,param[@"ts"],kAPIPublicKey,param[@"hash"]]);
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return request;
}
- (id) setupResponseDescriptors:(NSData*)data{
    NSError *parseError = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
    NSLog(@"%@", result);
    
    return  result;
}
- (NSInteger)checkStatusCode:(NSURLResponse *)response{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    NSInteger statusCode = httpResponse.statusCode;
    if(statusCode == INVALID){
        [self showAlertMessage:@"Invalid or unrecognized parameter"];
    }
    
    return  statusCode;
}
- (NSDictionary *)authParams
{
   
    NSString *timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    
    const char *ptr = [[NSString stringWithFormat:@"%@%@%@", timestamp, kAPIPrivateKey, kAPIPublicKey] UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return @{@"ts": timestamp, @"hash": hash};
}

@end

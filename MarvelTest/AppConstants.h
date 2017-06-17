//
//  AppConstants.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

#define TheApp AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate]

#define SUCCSESS 200
#define INVALID 409


#define TITLEFONT @"Helvetica-Bold"
#define DETAILFONT @"Helvetica-Light"

static NSString * const kDevBaseApiUrl  =  @"http://gateway.marvel.com:80/v1/public";
static NSString * const kAPIPublicKey  =  @"578cdd4aeaf93e44d0f90ea3b2abcfc6";
static NSString * const kAPIPrivateKey  =  @"2ad9b3a3b8df02fd1afa9ac214e35b708f38c792";

typedef NS_ENUM(NSUInteger, NavBarType) {
    NONTYPE = 0,
    BASETYPE,
    BACKTYPE
};

#endif /* AppConstants_h */

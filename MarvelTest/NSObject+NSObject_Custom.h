//
//  NSObject+NSObject_CustomFont.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface NSObject (NSObject_Custom)

@property (strong, nonatomic) NSString *fontName;
@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) CGFloat fontSize;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) UIColor* borderColor;


- (UIFont*) fontFromScreen:(NSArray*)param withFontName:(NSString*)fontName;
- (id)checkPresentForClassDescriptor:(NSString*)objID;
- (CGSize)sizeWithText:(NSString*)text width:(CGFloat)wdt font:(UIFont*)font;
- (void)clearPresentForClassDescriptor;
- (void)showIndecator:(BOOL)state;
- (void)showAlertMessage:(NSString*)message;
- (BOOL)isParamValid:(id)obj;
- (NSString *)documentsPathForFileName:(NSString *)name;
- (void)customizeAppearance;
- (NSString*)milsTimeStampt;

@end

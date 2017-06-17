//
//  NSObject+NSObject_CustomFont.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "NSObject+NSObject_Custom.h"
#import <SDVersion/SDVersion.h>
#import "DGActivityIndicatorView.h"


static NSMapTable *requestClasses = nil;
static dispatch_once_t onceToken;
static DGActivityIndicatorView *viewButton;
static UIWindow *window;


@implementation NSObject (NSObject_Custom)

@dynamic font,fontSize,cornerRadius,borderColor;



- (NSString *)fontName
{
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName
{
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}
- (void)setFontSize:(CGFloat)fontSize{
    CGFloat sizeFont = fontSize;
    DeviceSize size = [SDiOSVersion deviceSize];
    if(size == Screen4inch || size == Screen3Dot5inch)
        sizeFont -= 2.f;

    self.font = [UIFont fontWithName:self.font.fontName size:sizeFont];

    
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    CALayer* l = [(UIView*)self layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:cornerRadius];
}
- (void)setBorderColor:(UIColor *)borderColor{
    [[(UIView*)self layer]setBorderWidth:0.7];
    [(UIView*)self layer].borderColor = borderColor.CGColor;
}
-(UIFont*) fontFromScreen:(NSArray*)param withFontName:(NSString*)fontName{
    
    CGFloat pointSize = 18.f;
    
    if(param != nil){
        DeviceSize size = [SDiOSVersion deviceSize];
        if(param.count == 3){
            if(size == Screen5Dot5inch){
                pointSize = ((NSNumber*)param[0]).floatValue;
            } else if(size == Screen4Dot7inch){
                pointSize = ((NSNumber*)param[1]).floatValue;
            }else if(size == Screen4inch || size == Screen3Dot5inch){
                pointSize = ((NSNumber*)param[2]).floatValue;
            }
        }
    }
    
    return  [UIFont fontWithName:fontName size:pointSize];;
}

- (void)clearPresentForClassDescriptor{
    [requestClasses removeAllObjects];
}
- (id)checkPresentForClassDescriptor:(NSString*)objID{
    
    if(objID == nil)
        return nil;

    dispatch_once(&onceToken, ^{
        requestClasses = [NSMapTable weakToStrongObjectsMapTable];
    });
    
    if ([requestClasses objectForKey:objID]) {
       return [requestClasses objectForKey:objID];
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id Obj = [storyboard instantiateViewControllerWithIdentifier:objID];
    [requestClasses setObject:Obj forKey:objID];
    
    return Obj;
}
- (CGSize)sizeWithText:(NSString*)text width:(CGFloat)wdt font:(UIFont*)font{
    CGSize maximumLabelSize = CGSizeMake(wdt, FLT_MAX);
    CGRect rectbut = [text boundingRectWithSize:maximumLabelSize
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName : font}
                                        context:nil];
    
    
    return rectbut.size;
}

- (void)showAlertMessage:(NSString*)message{
    TheApp;
    
    UIAlertController* alert= [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* actionOK = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionOK];
    [app.window.rootViewController presentViewController:alert animated:YES completion:nil];
}


- (void)showIndecator:(BOOL)state{

    viewButton = nil;
    [viewButton stopAnimating];
    [viewButton removeFromSuperview];
    window.hidden = YES;
    window = nil;
    viewButton = nil;
    
    if(state){

        window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        window.windowLevel = UIWindowLevelAlert + 1.0;
        window.backgroundColor = [UIColor clearColor];
        [window makeKeyAndVisible];
        
        
        CGRect frame= [[UIScreen mainScreen]bounds];
        
        viewButton =  [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor colorWithRed:11.f/255.f green:13.f/255.f blue:13.f/255.f alpha:1.f] size:50.0f];
        
        viewButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                       UIViewAutoresizingFlexibleBottomMargin |
                                       UIViewAutoresizingFlexibleLeftMargin |
                                       UIViewAutoresizingFlexibleRightMargin);
        viewButton.frame = CGRectMake(frame.size.width / 2 - 25.f, frame.size.height / 2 - 110.f, 50.0f, 50.0f);
        viewButton.tag = 23456;
        [window addSubview:viewButton];
        [window bringSubviewToFront:viewButton];
        [viewButton startAnimating];
    }
    
}

- (BOOL)isParamValid:(id)obj{
    if(obj == nil)
        return NO;
    if([obj isEqual:[NSNull null]])
        return NO;
    
    return YES;
}

- (NSString *)documentsPathForFileName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSArray *paths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    //NSString *documentsPath = [[paths lastObject]absoluteString];
    NSString *documentsPath = [paths firstObject];
    return [documentsPath stringByAppendingPathComponent:name];

}
- (void)customizeAppearance{

   
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:71.f / 255.f green:168.f / 255.f blue:23.f / 255.f alpha:1.f]];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                           NSFontAttributeName:[UIFont fontWithName:TITLEFONT size:18.f]
                                                           }];
    
    UIImage* image = [[UIImage alloc]init];
    
    [[UINavigationBar appearance] setBackgroundImage: image
                                       forBarMetrics: UIBarMetricsDefault];
    
    [UINavigationBar appearance].shadowImage = image;
    
    [image release];
    
   
}
- (NSString*)milsTimeStampt{
    
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: [NSDate date]];
    NSDate* dt = [NSDate dateWithTimeInterval: seconds sinceDate: [NSDate date]];
    NSTimeInterval timeStampinterval = [dt timeIntervalSince1970];
    long digits = (long)timeStampinterval; // this is the first 10 digits
    int decimalDigits = (int)(fmod(timeStampinterval, 1) * 1000); // this will get the 3 missing digits
    long timestamp = (digits * 1000) + decimalDigits;
    NSString *milsTimeStampt = [NSString stringWithFormat:@"%ld",timestamp];
    
    return milsTimeStampt;
}
@end

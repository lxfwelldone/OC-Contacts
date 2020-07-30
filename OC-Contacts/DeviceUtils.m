//
//  DeviceUtils.m
//  hznl
//
//  Created by mc on 2018/8/21.
//  Copyright © 2018年 com.hzlg. All rights reserved.
//

#import "DeviceUtils.h"

@implementation DeviceUtils

/**
 * 发送短信
 */
+ (void)sendMsgToPhone:(NSString *)phone{
    NSString *urlStr = [NSString stringWithFormat:@"sms://%@",phone];
    NSURL *url = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication] openURL:url];
}

/**
 * 使用webview打电话
 */
+ (void)calltelByWebView:(NSString *)telPhone{
    UIWebView *webView = [[UIWebView alloc]init];
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@",telPhone];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSLog(@"UIWebView 打电话telprompt: %@", urlStr);
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

/**
 * 打电话，自动返回app, 无法上架
 */
+ (void)calltelpro:(NSString *)telPhone{
    NSString *urlStr = [NSString stringWithFormat:@"telprompt://%@",telPhone];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSLog(@"application 打电话telprompt: %@", urlStr);
    [[UIApplication sharedApplication] openURL:url];
}

/**
 * 拨打电话，无法自动返回app
 */
+ (void)calltel:(NSString *)telPhone{
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@",telPhone];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSLog(@"application 打电话tel: %@", urlStr);
    [[UIApplication sharedApplication] openURL:url];
}

/**
 * 判断当前设备是否为iPhone
 */
+ (Boolean)isiPhone{
   return [[UIDevice currentDevice].model containsString:@"iPhone"];
}

/** 获取系统版本号 */
+ (double)getSystemVersion {
    NSString *version = [UIDevice currentDevice].systemVersion;
    return version.doubleValue;
}

/** 获取设备昵称 */
+ (NSString *)getDeviceName{
   return [[UIDevice currentDevice] name];
}

/** 获取系统名称及版本 */
+ (NSString *)getSystemNameVersion{
    return [NSString stringWithFormat:@"%@ %@",[[UIDevice currentDevice] systemName],[UIDevice currentDevice].systemVersion];
}

/** 获取设备型号 */
+ (NSString *)getDeviceModel{
   return  [[UIDevice currentDevice] model];
}

/** 获取系统当前使用语言 */
+ (NSString *)getSystemUseLanguage{
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    return language;
}

/** 获取设备制造商 */
+ (NSString *)getDeviceManufacturer{
    return @"Apple";
}

+ (NSString *)getiphoneType{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7"; //美台版
    
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus"; //美台版
    
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8"; //美版
    
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus"; //美版
    
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X"; //美版

    
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])   return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])  return @"iPhone Simulator";
    
    return platform;
    
}

@end

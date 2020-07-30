//
//  DeviceUtils.h
//  hznl
//
//  Created by mc on 2018/8/21.
//  Copyright © 2018年 com.hzlg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@interface DeviceUtils : NSObject

/**
 * 发送短信
 */
+ (void)sendMsgToPhone:(NSString *)phone;

/**
 * 使用webview打电话
 */
+ (void)calltelByWebView:(NSString *)telPhone;

/**
 * 打电话，自动返回app, 无法上架appStore
 */
+ (void)calltelpro:(NSString *)telPhone;

/**
 * 打电话，无法自动返回app
 */
+ (void)calltel:(NSString *)telPhone;

/**
 * 判断当前设备是否为iPhone
 */
+ (Boolean)isiPhone;

+ (double)getSystemVersion;

+ (NSString *)getDeviceName;

+ (NSString *)getSystemNameVersion;

+ (NSString *)getDeviceModel;

+ (NSString *)getSystemUseLanguage;

+ (NSString *)getDeviceManufacturer;

+ (NSString *)getiphoneType;


@end

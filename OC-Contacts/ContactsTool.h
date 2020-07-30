//
//  ContactsTool.h
//  BaseApp
//
//  Created by mc on 2018/12/29.
//  Copyright © 2018年 com.hzlg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>

@interface ContactsTool : NSObject

- (instancetype)init NS_UNAVAILABLE; 

+ (NSArray<CNContact *> *)getAllContactsInVC:(UIViewController *)vc;

@end

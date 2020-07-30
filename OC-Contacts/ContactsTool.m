//
//  ContactsTool.m
//  BaseApp
//
//  Created by mc on 2018/12/29.
//  Copyright © 2018年 com.hzlg. All rights reserved.
//

#import "ContactsTool.h"

@implementation ContactsTool

+ (NSArray<CNContact *> *)getAllContactsInVC:(UIViewController *)vc{
    if (@available(iOS 9.0, *)) {
        switch ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]) {
            case CNAuthorizationStatusNotDetermined:
                NSLog(@"111111");
                return [self getAllContactsAfterPermission:vc];
            case CNAuthorizationStatusRestricted:
                NSLog(@"222222");
                break;
            case CNAuthorizationStatusDenied:
                NSLog(@"333333");
                return [self getAllContactsAfterPermission:vc];
            case CNAuthorizationStatusAuthorized:
                NSLog(@"444444");
                return [self getAllContacts:vc];
        }
    } else {
        NSLog(@"请升级到iOS9或更高版本！");
    }
    return nil;
}


+ (NSMutableArray<CNContact *> *)getAllContactsAfterPermission:(UIViewController *)vc{
    NSMutableArray<CNContact *> * data = [[NSMutableArray alloc] initWithCapacity:0];
    CNContactStore * contactStore = [[CNContactStore alloc] init];
    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted == YES) {
           [data addObjectsFromArray:[self getAllContacts:vc]];
        } else {
            NSLog(@"不能拒绝啊大哥");
        }
    }];
    return data;
}

+ (NSArray<CNContact *> *)getAllContacts:(UIViewController *)vc{
    if (@available(iOS 9.0, *)) {
        CNContactStore * store = [[CNContactStore alloc] init];
        NSArray * descs = [[NSArray alloc] initWithObjects:
                           CNContactNamePrefixKey,
                           CNContactGivenNameKey,
                           CNContactMiddleNameKey,
                           CNContactFamilyNameKey,
                           CNContactPreviousFamilyNameKey,
                           CNContactNameSuffixKey,
                           CNContactNicknameKey,
                           CNContactNamePrefixKey,
                           CNContactOrganizationNameKey,
                           CNContactDepartmentNameKey,
                           CNContactPhoneNumbersKey,
                           CNContactIdentifierKey,
                           nil];
        
        NSPredicate *pre = nil;
        NSArray * contacts = [store unifiedContactsMatchingPredicate:pre keysToFetch:descs error:nil];
        return contacts;
    }else{
        NSLog(@"请升级到iOS9或更高版本系统！");
    }
    return nil;
}

@end

//
//  ViewController.m
//  LzCallAndMessage
//
//  Created by mc on 2019/4/10.
//  Copyright © 2019年 lxf. All rights reserved.
//

#import "ViewController.h"
#import "DeviceUtils.h"
#import <Contacts/Contacts.h>
#import "ContactsTool.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)clicks:(UIButton *)sender {
    NSString * phone = @"18009607166";
    
    switch (sender.tag) {
        case 1:
            [DeviceUtils calltel:phone];
            break;
        case 2:
            [DeviceUtils calltelpro:phone];
            break;
        case 3:
            [DeviceUtils calltelByWebView:phone];
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            [self getContacts];
            break;
            
        default:
            break;
    }
}
#pragma mark - 将手机联系人转为PhoneUser
- (NSMutableArray*)getContacts{
    NSMutableArray * users = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray<CNContact *> * data = [ContactsTool getAllContactsInVC:self];
    for (CNContact *c in data) {
        // 字典用来存储 联系人
        NSDictionary *contact = [[NSMutableDictionary alloc] initWithCapacity:0];
        // 数组用来存储 联系人所有电话号码
        NSMutableArray * phones = [[NSMutableArray alloc] initWithCapacity:0];
        NSArray<CNLabeledValue<CNPhoneNumber*>*> * phonenumbers = c.phoneNumbers;
        for (CNLabeledValue<CNPhoneNumber*> *lblValue in phonenumbers) {
            [phones addObject:[lblValue.value stringValue]];
        }
        [contact setValue:phones forKey:@"phones"];
//        拼接名字，分别为全名和最后两个字
        NSString *fullName = [NSString stringWithFormat:@"%@%@",c.familyName, c.givenName];
        [contact setValue:fullName forKey:@"fullName"];
        NSString * briefName = @"";
        if (c.givenName != nil && [c.givenName length] >=2) {
            briefName = [c.givenName substringFromIndex:c.givenName.length-2];
        } else {
            if (fullName.length >= 2) {
                briefName = [fullName substringFromIndex:fullName.length-2];
            } else {
                briefName = fullName;
            }
        }
        [contact setValue:briefName forKey:@"briefName"];
        
        NSLog(@"联系人及电话：%@",contact);
    }
    return users;
}


@end

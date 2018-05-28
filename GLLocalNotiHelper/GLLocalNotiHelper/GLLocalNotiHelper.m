//
//  GLLocalNotiHelper.m
//  BMom
//
//  Created by gulu on 2017/11/7.
//  Copyright © 2017年 gulu. All rights reserved.
//

#import "GLLocalNotiHelper.h"
#import "MJExtension.h"

@implementation GLLocalNotiHelper
+ (void)createLocalNotificationWithModel:(GLLocalNotiModel *)model {
    // ios8后，需要添加这个注册，才能得到授权
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
            UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                     categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }
    });
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.fireDate =model.fireDate;
    // 通知内容
    notification.alertBody = model.message;
    notification.alertTitle = model.title;
    notification.soundName = model.soundName;
    notification.repeatInterval = model.repeatInterval;
    notification.applicationIconBadgeNumber = model.applicationIconBadgeNumber;
    // 通知参数
    notification.userInfo = [model mj_keyValues];
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}


#pragma mark - 获取所有的本地通知

+ (NSArray <UILocalNotification *> *)getAllLocalNotification {
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    return localNotifications;
}

+ (NSMutableArray <GLLocalNotiModel *> *)getAllLocalNotiUserInfoModel {
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    NSMutableArray *array;
    if (localNotifications.count) array = [[NSMutableArray alloc] init];
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            GLLocalNotiModel *infoModel = [GLLocalNotiModel mj_objectWithKeyValues:userInfo];
            [array addObject:infoModel];
        }
    }
    return array;
}

#pragma mark - 取消某个本地推送通知

+ (void)cancelLocalNotificationWithID:(NSString *)notiId {
    // 获取所有本地通知数组
    NSArray *localNotifications = [GLLocalNotiHelper getAllLocalNotification];
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            GLLocalNotiModel *infoModel = [GLLocalNotiModel mj_objectWithKeyValues:userInfo];
            // 如果找到需要取消的通知，则取消
            if ([infoModel.notiId isEqualToString:notiId]) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
            }
        }
    }
}

#pragma mark -取消某类本地推送通知
+ (void)cancelLocalNotificationWithNotifyType:(NSUInteger)type {
    // 获取所有本地通知数组
    NSArray *localNotifications = [GLLocalNotiHelper getAllLocalNotification];
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            GLLocalNotiModel *infoModel = [GLLocalNotiModel mj_objectWithKeyValues:userInfo];
            // 如果找到需要取消的通知，则取消
            if (type==infoModel.type) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
            }
        }
    }
}

#pragma mark -取消所有本地推送通知
+ (void)cancelAllLocalNotifications {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end

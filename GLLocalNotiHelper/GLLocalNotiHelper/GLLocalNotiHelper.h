//
//  GLLocalNotiHelper.h
//  BMom
//
//  Created by gulu on 2017/11/7.
//  Copyright © 2017年 gulu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLLocalNotiModel.h"

@interface GLLocalNotiHelper : NSObject

/**
 创建一个通知
 创建一个过期的本地通知会立即执行
 @param model
 */
+ (void)createLocalNotificationWithModel:(GLLocalNotiModel *)model;

/**
 获取所有本地通知
 
 @return
 */
+ (NSArray <UILocalNotification *>*)getAllLocalNotification;
+ (NSMutableArray <GLLocalNotiModel *> *)getAllLocalNotiUserInfoModel;

/**
 根据通知的id取消一个通知

 @param notiId
 */
+ (void)cancelLocalNotificationWithID:(NSString *)notiId;

/**
 取消某类本地推送通知

 @param type
 */
+ (void)cancelLocalNotificationWithNotifyType:(NSUInteger)type;

/**
 取消全部通知
 */
+ (void)cancelAllLocalNotifications;
@end

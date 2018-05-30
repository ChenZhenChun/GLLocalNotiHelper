//
//  GLLocalNotiModel.h
//  BMom
//
//  Created by gulu on 2017/11/7.
//  Copyright © 2017年 gulu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLLocalNotiModel : NSObject
@property (nonatomic,copy)      NSString        *notiId;//通知的唯一id
@property (nonatomic,copy)      NSString        *title;//通知标题
@property (nonatomic,copy)      NSString        *message;//通知内容
@property (nonatomic,strong)    NSDate          *fireDate;//触发时间
@property (nonatomic,assign)    NSUInteger      type;//本地通知的类型(根据自己业务类型自己定类型)
@property (nonatomic,copy)      NSString        *soundName;//name of resource in app's bundle to play or UILocalNotificationDefaultSoundName （clock.caf）
@property(nonatomic)            NSInteger       applicationIconBadgeNumber;// 0 means no change. defaults to 0
@property (nonatomic,strong)    id              remark;
/**
 NSCalendarUnitEra                 -- 纪元单位。对于 NSGregorianCalendar (公历)来说，只有公元前(BC)和公元(AD)；
 NSCalendarUnitYear                -- 年单位。值很大，相当于经历了多少年，未来多少年。
 NSCalendarUnitMonth               -- 月单位。范围为1-12
 NSCalendarUnitDay                 -- 天单位。范围为1-31
 NSCalendarUnitHour                -- 小时单位。范围为0-24
 NSCalendarUnitMinute              -- 分钟单位。范围为0-60
 NSCalendarUnitSecond              -- 秒单位。范围为0-60
 NSCalendarUnitWeekOfYear          -- 周单位。范围为1-53（就是每周固定时间点提醒啦）
 NSCalendarUnitWeekday             -- 星期单位，每周的7天。范围为1-7 （就是每天固定时间点都会提醒啦）
 NSCalendarUnitQuarter             -- 几刻钟，也就是15分钟。范围为1-4
 */
@property(nonatomic)            NSCalendarUnit  repeatInterval;// 0 means don't repeat
@end

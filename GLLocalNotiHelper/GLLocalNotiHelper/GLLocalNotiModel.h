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
@property (nonatomic,copy)      NSString        *soundName;//name of resource in app's bundle to play or UILocalNotificationDefaultSoundName
@property(nonatomic)            NSCalendarUnit  repeatInterval;// 0 means don't repeat
@property(nonatomic)            NSInteger       applicationIconBadgeNumber;// 0 means no change. defaults to 0
@end

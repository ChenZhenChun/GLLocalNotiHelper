//
//  GLLocalNotiModel.m
//  BMom
//
//  Created by gulu on 2017/11/7.
//  Copyright © 2017年 gulu. All rights reserved.
//

#import "GLLocalNotiModel.h"
@interface GLLocalNotiModel()

@end

@implementation GLLocalNotiModel
- (NSString *)soundName {
    return _soundName?_soundName:UILocalNotificationDefaultSoundName;
}
@end

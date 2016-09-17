//
//  CJAccountTool.h
//  jiuducaijing
//
//  Created by 王加祥 on 16/8/22.
//  Copyright © 2016年 王加祥. All rights reserved.
//  账号信息工具

#import <Foundation/Foundation.h>

@class CJAccount;

@interface CJAccountTool : NSObject

/**
 *  存储账户信息到本地
 */
+ (void) saveAccount:(CJAccount *)account;

/**
 *  获取用户账户信息
 *
 *  @return 个人账户
 */
+ (CJAccount *)account;

/**
 *  移除用户本地信息
 */
+ (void)removeAccount;

@end

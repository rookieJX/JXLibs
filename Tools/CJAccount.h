//
//  CJAccount.h
//  jiuducaijing
//
//  Created by 王加祥 on 16/8/22.
//  Copyright © 2016年 王加祥. All rights reserved.
//  账号信息模型

#import <Foundation/Foundation.h>

@interface CJAccount : NSObject
/**
 *  用户登陆成功标识,每次登陆成功返回的不一样
 */
@property (copy, nonatomic) NSString * token;

/**
 *  用户标识，判断是否为游客或者登录状态(1:为游客；2:为登录)
 */
@property (copy, nonatomic) NSString * type;
/**
 *  用户性别 （1：男，2：女，3：保密）
 */
@property (copy, nonatomic) NSString * gender;

/**
 * token的生命周期，单位是秒数
 */
@property (copy, nonatomic) NSString * expires;
/**
 *  用户名（可用来登录）
 */
@property (copy, nonatomic) NSString * username;
/**
 *  用户邮件
 */
@property (copy, nonatomic) NSString * email;
/**
 *  用户昵称（用来显示）
 */
@property (copy, nonatomic) NSString * nickname;
/**
 *  用户头像 URL
 */
@property (copy, nonatomic) NSString * headimage;
/**
 *  用户手机号
 */
@property (copy, nonatomic) NSString * phone;
/**
 *  用户分享码
 */
@property (copy, nonatomic) NSString * sharecode;
/**
 *  用户等级（新手，富人，财主，大财主，富商...）
 */
@property (copy, nonatomic) NSString * gradeid;
/**
 *  用户经验值
 */
@property (copy, nonatomic) NSString * expervalue;
/**
 *  用户九币
 */
@property (copy, nonatomic) NSString * ninemoney;
/**
 *  用户余额
 */
@property (copy, nonatomic) NSString * balance;
/**
 *  用户个性签名
 */
@property (copy, nonatomic) NSString * signature;
/**
 *  用户qq
 */
@property (copy, nonatomic) NSString * qq;
/**
 *  用户微信
 */
@property (copy, nonatomic) NSString * weixin;
/**
 *  用户新浪
 */
@property (copy, nonatomic) NSString * sina;
/**
 *  用户房间号
 */
@property (copy, nonatomic) NSString * roomcode;
/**
 *  access_token的生命周期，单位是秒数
 */
@property (nonatomic,copy) NSString * expires_in;
/**
 *  过期时间(这里是本地计算，不需要服务器返回)
 */
@property (nonatomic,strong) NSDate * expires_time;
/**
 *  用户类型，1为普通用户，2为签约用户
 */
@property (nonatomic,strong) NSString * usertype;
/**
 *  房间号码：只有在注册成为主播的时候才会有
 */
@property (nonatomic,strong) NSString * roomid;
/**
 *  工作
 */
@property (nonatomic,strong) NSString * job;

/**
 *  将字典转换成模型
 */
+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end

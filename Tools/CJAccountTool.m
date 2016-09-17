//
//  CJAccountTool.m
//  jiuducaijing
//
//  Created by 王加祥 on 16/8/22.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "CJAccountTool.h"
#import "CJAccount.h"

#define AccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"account.archiver"]

@implementation CJAccountTool

+ (void)saveAccount:(CJAccount *)account{
    
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
}


+ (CJAccount *)account{
    // 解档
    CJAccount * account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];

    // 判断账号是否过期
    NSDate * now = [NSDate date];
    if ([now compare:account.expires_time] == NSOrderedDescending) { // 过期
        return nil;
    }

    return account;
}


+ (void)removeAccount{
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    BOOL isExist = [fileMgr fileExistsAtPath:AccountPath];
    
    if (isExist) {
        
        NSError *err;
        
        [fileMgr removeItemAtPath:AccountPath error:&err];
    }
}


@end

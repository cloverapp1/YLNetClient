//
//  YLCustomNetConfig.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLUserModel.h"

@implementation YLUserModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"regionPrivileges":[StoreInfoDto class],
             @"shopPrivileges":[StoreInfoDto class],
             @"roles":[RoleDto class],
             @"passportUser":[UserDataDto class]
             };
}


@end

@implementation RoleDto

@end

@implementation UserDataDto

@end

@implementation StoreInfoDto

@end

//
//  YLCustomNetConfig.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLDataModel.h"
@class RoleDto,UserDataDto,StoreInfoDto;

NS_ASSUME_NONNULL_BEGIN

@interface YLUserModel : YLDataModel

@property(nonatomic, strong) UserDataDto* passportUser;

@property(nonatomic, copy) NSString* shopCode;
@property(nonatomic, copy) NSString* token;
@property(strong,nonatomic) NSArray<RoleDto *>* roles;
@property(strong,nonatomic) NSArray<StoreInfoDto *>* regionPrivileges;
@property(strong,nonatomic) NSArray<StoreInfoDto *>* shopPrivileges;
@property(assign,nonatomic) BOOL updatePassword;

@end

@interface RoleDto : YLDataModel
@property (nonatomic, copy) NSString* id;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* profile;
@property (nonatomic, copy) NSString* roleType;

@end

@interface UserDataDto : YLDataModel
@property (nonatomic, copy) NSString* id;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, copy) NSString* telephone;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* nickname;
@property (nonatomic, assign) NSInteger createdTime;
@property (nonatomic, copy) NSString* createdBy;
@property (nonatomic, assign) NSInteger updatedTime;
@property (nonatomic, copy) NSString* updatedBy;
@property (nonatomic, copy) NSString* note;
@property (nonatomic, copy) NSString* userId;


@end

@interface StoreInfoDto : YLDataModel

@property(nonatomic, copy) NSString* dataDesc;
@property(nonatomic, copy) NSString* dataId;
@property(nonatomic, copy) NSString* dataType;
@property(nonatomic, copy) NSString* id;
@property(nonatomic, copy) NSString* userId;
@property(nonatomic, copy) NSString* regionName;

@end

NS_ASSUME_NONNULL_END

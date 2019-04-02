//
//  YLCustomNetConfig.m
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLCustomNetConfig.h"

@implementation YLCustomNetConfig

+ (instancetype)sharedConfiguration
{
    static YLCustomNetConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [YLCustomNetConfig new];
    });
    return config;
}

- (NSInteger)requestTimeOut
{
    return 30.f;
}

- (NSDictionary*)customRequestHeader
{
    return @{@"Content-Type":@"application/json",@"X-AUTH-TOKEN":@"",@"X-DEVICE":@"iOS",@"X-VERSION":@"1.64"};
}

- (NSSet *)responseAcceptableContentTypes
{
    return [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
}

- (NSInteger)requestParameterEncoding
{
    return 1;
}

- (NSInteger)responseParameterEncoding
{
    return 0;
}

@end

//
//  YLRequestControl.m
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/2.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLRequestControl.h"

@implementation YLRequestControl

+ (void)loginViewParamter:(NSDictionary *)paramter
                   inView:(UIView *)view
                      ret:(RequestControlBack)requestBlock
{
    YLCustomNetConfig *config = [YLCustomNetConfig sharedConfiguration];
    YLNetworkTool *request = [[YLNetworkTool alloc] initWithConfiguration:config];
    
    [request POST:@"http://freshserver.dev.ys.yh-test.com/pub/fresh/user/login" inView:view parameters:paramter requestBack:^(BOOL requestSuccess, id  _Nullable response, NSString * _Nullable responseJson, NSDictionary * _Nullable requestDic, NSString *_Nullable errorMessage) {
        if (requestSuccess) {
            YLDataModel *userModel = [[YLUserModel alloc]initWithDictionary:response responseClass:[YLUserModel class]];
            requestBlock(userModel, userModel.ylresponse, nil);
        }else{
            requestBlock(nil, nil, errorMessage);
        }
    }];
}

@end

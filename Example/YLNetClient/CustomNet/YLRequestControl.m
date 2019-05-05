//
//  YLRequestControl.m
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/2.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLRequestControl.h"
#import "MBProgressHUD.H"

#define YHNETWORK_REQUEST_MACRO(REQUESTCONFIG, METHOD, URL, HUD, PARAMTER, MODELCLASS) \
YLNetworkTool *request = [[YLNetworkTool alloc] initWithConfiguration:REQUESTCONFIG];\
[request METHOD:URL inView:nil parameters:PARAMTER requestBack:^(BOOL requestSuccess, id  _Nullable response, NSString * _Nullable responseJson, NSDictionary * _Nullable requestDic, NSString *_Nullable errorMessage) {\
    [HUD hideAnimated:YES];\
    NSLog(@"消失");\
    if (requestSuccess) {\
        YLDataModel *userModel = [[MODELCLASS alloc]initWithDictionary:response responseClass:[MODELCLASS class]];\
        requestBlock(userModel, userModel.ylresponse, nil);\
    }else{\
        requestBlock(nil, nil, errorMessage);\
    }\
}];\


@implementation YLRequestControl

+ (MBProgressHUD *)hudFromView:(UIView *)view
{
    MBProgressHUD *hud = nil;;
    if (view) {
        NSLog(@"显示");
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.backgroundColor = [UIColor clearColor];
    }
    return hud;
}

+ (void)loginViewParamter:(NSDictionary *)paramter
                   inView:(UIView *)view
                      ret:(RequestControlBack)requestBlock
{
    YLCustomNetConfig *config = [YLCustomNetConfig sharedConfiguration];
//    示例一
    YLNetworkTool *request = [[YLNetworkTool alloc] initWithConfiguration:config];

    [request POST:@"http://freshserver.dev.ys.yh-test.com/pub/fresh/user/login" inView:view parameters:paramter requestBack:^(BOOL requestSuccess, id  _Nullable response, NSString * _Nullable responseJson, NSDictionary * _Nullable requestDic, NSString *_Nullable errorMessage) {
        NSLog(@"消失");
        if (requestSuccess) {
            YLDataModel *userModel = [[YLUserModel alloc]initWithDictionary:response responseClass:[YLUserModel class]];
            requestBlock(userModel, userModel.ylresponse, nil);
        }else{
            requestBlock(nil, nil, errorMessage);
        }
    }];
    
//    示例二
//    MBProgressHUD *hud =  [YLRequestControl hudFromView:view];
//    YHNETWORK_REQUEST_MACRO(config, POST, @"http://freshserver.dev.ys.yh-test.com/pub/fresh/user/login",hud, paramter, YLUserModel);
}

@end

//
//  YLNetworkTool.m
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLNetworkTool.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <YLJsonLib/YLJastor.h>

#ifdef DEBUG
#define YLLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define YLLog(format, ...)
#endif

#define YLNETWORK_REQUEST_MACRO(METHOD, HUD, URL, PARAMTER) \
[super METHOD:URL parameters:PARAMTER success:^(NSURLSessionDataTask * task, id responseObject) { \
    if (HUD){\
        [HUD hideAnimated:YES];}\
    NSString *jsonStr;\
    if (responseObject) {\
        jsonStr = [(NSDictionary *)responseObject yy_modelToJSONString];}\
    requestBack(YES, responseObject, jsonStr, parameters, nil);\
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {\
    if (HUD){\
        [HUD hideAnimated:YES];}\
    requestBack(NO, nil, nil, parameters, [error localizedDescription]);\
}]

@implementation YLNetworkTool

- (MBProgressHUD *)hudFromView:(UIView *)view
{
    MBProgressHUD *hud = nil;;
    if (view) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.backgroundColor = [UIColor clearColor];
    }
    return hud;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                        inView:(UIView *)view
                    parameters:(id)parameters
                   requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(POST, hud, URLString, parameters);
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(GET, hud, URLString, parameters);
}

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                          inView:(UIView *)view
                      parameters:(id)parameters
                     requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(DELETE, hud, URLString, parameters);
}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(PUT, hud, URLString, parameters);
}

- (NSURLSessionDataTask *)UPLOAD:(NSString *)URLString
                          inView:(UIView *)view
                      parameters:(id)parameters
       constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
                        progress:(void (^)(NSProgress *))uploadProgress
                     requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return [super UPLOAD:URLString
              parameters:parameters
constructingBodyWithBlock:block
                progress:uploadProgress
                 success:^(NSURLSessionDataTask *task, id responseObject) {
                     [hud hideAnimated:YES];
                     if (responseObject) {
                         NSString *jsonStr = [(NSDictionary *)responseObject yy_modelToJSONString];
//                         YLLog(@"jsonStr = %@",jsonStr);
                     }
                     requestBack(YES, responseObject, nil, parameters, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [hud hideAnimated:YES];
        requestBack(NO, nil, nil, parameters, [error localizedDescription]);
    }];
}

@end

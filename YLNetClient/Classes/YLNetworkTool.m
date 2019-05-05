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
    return YLNETWORK_REQUEST_MACRO(POST, hud);
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(GET, hud);
}

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                          inView:(UIView *)view
                      parameters:(id)parameters
                     requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(DELETE, hud);
}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack)requestBack
{
    MBProgressHUD *hud = [self hudFromView:view];
    return YLNETWORK_REQUEST_MACRO(PUT, hud);
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
                         YLLog(@"jsonStr = %@",jsonStr);
                     }
                     requestBack(YES, responseObject, nil, parameters, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [hud hideAnimated:YES];
        requestBack(NO, nil, nil, parameters, [error localizedDescription]);
    }];
}

@end

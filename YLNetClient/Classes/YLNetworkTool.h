//
//  YLNetworkTool.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLNetworkClient.h"

//NS_ASSUME_NONNULL_BEGIN

typedef void(^YLClientRequestBack)(BOOL requestSuccess, id _Nullable response, NSString *_Nullable responseJson, NSDictionary *_Nullable requestDic, NSString *_Nullable errorMessage);

@interface YLNetworkTool : YLNetworkClient

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                        inView:(UIView *)view
                    parameters:(id)parameters
                   requestBack:(YLClientRequestBack _Nullable )requestBack;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack _Nullable )requestBack;

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                          inView:(UIView *)view
                      parameters:(id)parameters
                     requestBack:(YLClientRequestBack _Nullable )requestBack;

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                       inView:(UIView *)view
                   parameters:(id)parameters
                  requestBack:(YLClientRequestBack _Nullable )requestBack;

- (NSURLSessionDataTask *)UPLOAD:(NSString *)URLString
                          inView:(UIView *)view
                      parameters:(id)parameters
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                        progress:(void (^)(NSProgress *))uploadProgress
                     requestBack:(YLClientRequestBack _Nullable )requestBack;

@end

//NS_ASSUME_NONNULL_END

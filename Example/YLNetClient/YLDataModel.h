//
//  YLCustomNetConfig.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import <YLNetClient/YLBaseResult.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLDataModel : YLBaseResult

@property (strong, nonatomic) id ylresponse;      //数据
@property (strong, nonatomic) NSString *message;  //描述
@property (assign, nonatomic) long code;  //状态码

/** 是否正确请求，code200 为正确 */
- (BOOL)requestCorrect;

- (id)initWithDictionary:(NSDictionary *)dictionary responseClass :(id)responseClass;


@end




NS_ASSUME_NONNULL_END

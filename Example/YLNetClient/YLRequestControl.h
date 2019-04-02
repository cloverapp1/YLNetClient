//
//  YLRequestControl.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/2.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLCustomNetConfig.h"
#import "YLNetworkTool.h"
#import "YLUserModel.h"

typedef void(^RequestControlBack)(id result, id data, NSString *errorMessage);


NS_ASSUME_NONNULL_BEGIN

@interface YLRequestControl : NSObject

+ (void)loginViewParamter:(NSDictionary *)paramter
                   inView:(UIView *)view
                      ret:(RequestControlBack)requestBlock;

@end

NS_ASSUME_NONNULL_END

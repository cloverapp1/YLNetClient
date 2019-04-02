//
//  YLCustomNetConfig.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLNetConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLCustomNetConfig : NSObject<YLNetConfig>

+ (instancetype)sharedConfiguration;

@end

NS_ASSUME_NONNULL_END

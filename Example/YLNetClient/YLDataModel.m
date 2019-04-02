//
//  YLCustomNetConfig.h
//  YLNetClient_Example
//
//  Created by Yangli on 2019/4/1.
//  Copyright © 2019年 2510479687@qq.com. All rights reserved.
//

#import "YLDataModel.h"

@interface YLDataModel(){
    Class _responseClass;
}

@end

@implementation YLDataModel

- (BOOL)requestCorrect{
    return self.code == 200;
}

- (id)response_class {
    return _responseClass;
}

- (id)initWithDictionary:(NSDictionary *)dictionary responseClass :(id)responseClass{
    _responseClass = responseClass;
    YLDataModel *result = [YLDataModel modelWithDictionary:dictionary];
    if (dictionary[@"desc"]) {
        result.message = dictionary[@"desc"];
    }
    if (dictionary[@"data"]) {
        id obj = [_responseClass modelWithDictionary:dictionary[@"data"]];
        id t_result = dictionary[@"data"];
        if ([t_result isKindOfClass:[NSArray class]]) {
            obj = [_responseClass modelWithDictionary:@{@"data":t_result}];
        }else if ([t_result isKindOfClass:[NSString class]]){
            //返回数据是json串
            id t_dic = [YLDataModel convertjsonStringToDict:t_result];
            if ([t_dic isKindOfClass:[NSDictionary class]]) {
                obj = [_responseClass modelWithDictionary:t_dic];
            }else if ([t_dic isKindOfClass:[NSArray class]]){
                obj = [_responseClass modelWithDictionary:@{@"data":t_dic}];
            }
        }
        
        result.ylresponse = obj;
    }
    if (dictionary[@"response"]) {
        id obj = [_responseClass modelWithDictionary:dictionary[@"response"]];
        id t_result = dictionary[@"response"];
        if ([t_result isKindOfClass:[NSArray class]]) {
            obj = [_responseClass modelWithDictionary:@{@"data":dictionary[@"response"]}];
        }
        
        result.ylresponse = obj;
    }
    
    if (dictionary[@"result"]) {
        id obj = [_responseClass modelWithDictionary:dictionary[@"result"]];
        id t_result = dictionary[@"response"];
        if ([t_result isKindOfClass:[NSArray class]]) {
            obj = [_responseClass modelWithDictionary:@{@"data":dictionary[@"result"]}];
        }
        
        result.ylresponse = obj;
    }
    
    if (dictionary[@"firstPage"]) {
        result.ylresponse = [_responseClass modelWithDictionary:@{@"firstPage":dictionary[@"firstPage"]}];
    }
    
    return result;
}

+ (BOOL)handleResult:(YLDataModel *)result{
    [super handleResult:result];
    if (result == nil) {
        NSLog(@"网络不太给力哦");
        return NO;
    }else if (result.code == 200 || result.code == 0 || result.code == 200000){
        return YES;
    }
    return NO;
}

+ (id)convertjsonStringToDict:(NSString *)jsonString{
    id retDict = nil;
    if ([jsonString isKindOfClass:[NSString class]]) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        retDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        return  retDict;
    }else{
        return retDict;
    }
    
}

@end

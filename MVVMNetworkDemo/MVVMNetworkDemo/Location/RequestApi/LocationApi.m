//
//  LocationApi.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "LocationApi.h"

@interface LocationApi ()
@property (nonatomic, copy) NSString        *apiKey;
@property (nonatomic, copy) NSString        *areaID;
@property (nonatomic, copy) NSString        *action;
@property (nonatomic, copy) NSDictionary    *parameters;
@end

@implementation LocationApi

#pragma mark - init 
- (instancetype)initWithAreaID:(NSString *)areaID {
    self = [super init];
    if (self) {
        _apiKey = @"187d831349bb7b5944dd74da66e29d81";
        _areaID = areaID;
        _action = @"getArea";
        _parameters = @{@"action" : _action, @"areaID" : _areaID, @"key" : _apiKey};
    }
    return self;
}

#pragma mark - override;
- (id)requestParameters {
    return _parameters;
}

/**
 *  设置请求的方式SYRequestMethod (GET/POST/...)
 *
 *  @return SYRequestMethod
 */
- (SYRequestMethod)requestMethod {
    return SYRequestMethodGET;
}


- (SYRequestSerializerType)requestSerializerType {
    return SYRequestSerializerTypeJSON;
}
/**
 *  设置请求的地址,通常可在AppDelegate通过网络请求单例进行设置
 *
 *  @return NSString
 */
- (NSString *)baseURL {
    return @"http://AreaData.api.juhe.cn/AreaHandler.ashx";
}

@end

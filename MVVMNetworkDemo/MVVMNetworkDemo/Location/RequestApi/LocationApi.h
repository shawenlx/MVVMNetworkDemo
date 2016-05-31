//
//  LocationApi.h
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "SYBaseRequest.h"

@interface LocationApi : SYBaseRequest

- (instancetype)initWithAreaID : (NSString *)areaID;

@end

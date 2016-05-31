//
//  LocationModel.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"fullName" : @"FullName"};
}

+ (NSArray *)modelPropertyWhitelist {
    return @[@"fullName", @"name"];
}
@end

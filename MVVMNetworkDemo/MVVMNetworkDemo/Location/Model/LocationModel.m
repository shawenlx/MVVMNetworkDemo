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
    return @{@"ID" : @"id", @"province" : @"name"};
}

+ (NSArray *)modelPropertyWhitelist {
    return @[@"ID", @"province"];
}
@end

//
//  TestModel.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"fullName" : @"FullName"};
}

+ (NSArray *)modelPropertyWhitelist {
    return @[@"fullName", @"name"];
}
@end

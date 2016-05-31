//
//  LocationTableViewCell.h
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestModel;

@interface LocationTableViewCell : UITableViewCell
@property (nonatomic, strong) TestModel *locationModel;
@end

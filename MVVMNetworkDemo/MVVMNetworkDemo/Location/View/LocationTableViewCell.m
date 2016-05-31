//
//  LocationTableViewCell.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "LocationTableViewCell.h"
#import "TestModel.h"

@interface LocationTableViewCell ()
@property (nonatomic, strong) UILabel   *provinceLabel; //省名称
@end

@implementation LocationTableViewCell

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _provinceLabel = [[UILabel alloc]init];
        _provinceLabel.font = [UIFont boldSystemFontOfSize:15];
        _provinceLabel.textColor = [UIColor redColor];
        [self addSubview:_provinceLabel];
        
        [_provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.leading.equalTo(@10);
            make.bottom.equalTo(@(-10));
            make.trailing.lessThanOrEqualTo(@(-30));
        }];
    }
    return self;
}

- (void)prepareForReuse {
    _provinceLabel.text = nil;
}

- (void)setLocationModel:(TestModel *)locationModel {
    _locationModel = locationModel;
    self.provinceLabel.text = locationModel.name;
}

@end

//
//  LocationViewController.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationViewModel.h"
#import "LocationTableViewCell.h"

@interface LocationViewController ()
@property (nonatomic, strong) UITableView   *provinceList;
@property (nonatomic, strong) LocationViewModel *viewModel;
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Location";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    [self.viewModel requestNetwork:nil completion:^(id obj) {
        [_provinceList reloadData];
    } failure:^(id obj) {
        
    }];
}

- (void)initView {
    _provinceList = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _provinceList.delegate = self.viewModel;
    _provinceList.dataSource = self.viewModel;
    _provinceList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_provinceList registerClass:[LocationTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_provinceList];
//    
//    //设置布局约束
//    [_provinceList mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws.mas_top);
//        make.leading.mas_equalTo(ws.mas_leading);
//        make.trailing.mas_equalTo(ws.mas_trailing);
//        make.bottom.mas_equalTo(ws.mas_bottom);
//    }];
    
}

//由于viewModel 多次使用，所以采用懒加载的方式避免内存额外开销
#pragma mark - getter 
- (LocationViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LocationViewModel alloc]init];
        _viewModel.controller = self;
    }
    return _viewModel;
}
@end

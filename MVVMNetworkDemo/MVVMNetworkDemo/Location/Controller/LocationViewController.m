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
#import "LocationModel.h"

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
}

- (void)initView {
    __weak typeof(self.view) ws = self.view;
    _provinceList = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _provinceList.delegate = self.viewModel;
    _provinceList.dataSource = self.viewModel;
    _provinceList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_provinceList registerClass:[LocationTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_provinceList];
    
    //设置布局约束
    [_provinceList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.mas_top);
        make.leading.mas_equalTo(ws.mas_leading);
        make.trailing.mas_equalTo(ws.mas_trailing);
        make.bottom.mas_equalTo(ws.mas_bottom);
    }];
    
    // 下拉刷新
    self.provinceList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.viewModel requestNetwork:nil completion:^(id obj) {
            [_provinceList reloadData];
            [_provinceList.mj_header endRefreshing];
        } failure:^(id obj) {
            YSLog(@"请求失败");
            [_provinceList.mj_header endRefreshing];
        }];
    }];
    
    // 上拉刷新
//    self.provinceList.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//        [self.viewModel requestNetwork:nil completion:^(id obj) {
//            [_provinceList reloadData];
//            [_provinceList.mj_footer endRefreshing];
//        } failure:^(id obj) {
//            YSLog(@"请求失败");
//            [_provinceList.mj_footer endRefreshing];
//        }];
//    }];
    
    [self.provinceList.mj_header beginRefreshing];

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

//
//  LocationViewModel.m
//  MVVMNetworkDemo
//
//  Created by liuxi on 16/5/31.
//  Copyright © 2016年 liuxi. All rights reserved.
//

#import "LocationViewModel.h"
#import "LocationTableViewCell.h"
#import "LocationApi.h"
#import "LocationModel.h"
@interface LocationViewModel ()
@property (nonatomic, strong) NSMutableArray    *dataArray;

@end

@implementation LocationViewModel

- (void)requestNetwork:(id)parmaters completion:(void (^)(id))completion failure:(void (^)(id))failure {
    LocationApi *api = [[LocationApi alloc]initWithAreaID:@"0"];    
    [api startWithBlockSuccess:^(__kindof SYBaseRequest *request) {
        NSLog(@"%@",request.responseJSONObject);
        self.dataArray = [self dataAnalysisFromJson:request.responseJSONObject request:request];
        if (completion) {
            completion(@(YES));
        }
    } failure:^(__kindof SYBaseRequest *request, NSError *error) {
        
    }];
    
}

- (id)dataAnalysisFromJson:(id)json request:(SYBaseRequest *)request {
    if ([json[@"code"] integerValue] == 0){
        //进行数据解析
        return [NSArray yy_modelArrayWithClass:[LocationModel class] json:json[@"str"][@"regions"]];    }
    return nil;
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.locationModel = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
#pragma mark - DZNEmptyDataSetSource Methods

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    /**
     此处为当tableView为空时，所要显示的自定义的view，示例代码如下
     
     UIView * customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
     customView.backgroundColor = DCOLOR_RANDOM;
     return customView;
     */
    return nil;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 0;
}

#pragma mark - DZNEmptyDataSetSource Methods

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return NO;
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    NSLog(@"%s",__FUNCTION__);
}
@end

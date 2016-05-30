//
//  BaseViewModel.m
//  Yoshop
//
//  Created by zhaowei on 16/5/25.
//  Copyright © 2016年 yoshop. All rights reserved.
//

#import "BaseViewModel.h"
#import "SYBaseRequest.h"

@implementation BaseViewModel
/**
 *  该方法为页面请求数据，继承BaseViewModel的类要根据自己的需要重写该方法
 *
 *  @param parmaters             网络请求参数
 *  @param completionExcuteBlock 请求完成后所要执行的操作，如：重新页面等
 */
- (void)requestNetwork:(id)parmaters completion:(void (^)(id obj)) completion failure:(void (^)(id obj))failure{
    if (completion) {
        completion(nil);
    }
}
/**
 *  数据解析方法，后期要提取通用，如果特殊再重写该方法
 *
 *  @param json    网络请求返回的数据-以JSON格式为主
 *  @param request 发送请求的API
 *
 *  @return 返回所需要的类型可以是字典，model，数组。。。。
 */
- (id)dataAnalysisFromJson:(id)json  request:(SYBaseRequest *)request{
    return nil;
}
/**
 *  提示信息
 *
 *  @param info 提示信息
 */
- (void)alertMessage:(NSString *)info {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
//                                                    message:info
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = info;
    hud.margin = 10.f;
//    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:3];
    
}
/**
 *  网络请求刷新
 *
 *  @param sender
 */
- (void)emptyOperationTouch:(id)sender {
    if(self.emptyOperationBlock){
        self.emptyOperationBlock();
    }
}
@end

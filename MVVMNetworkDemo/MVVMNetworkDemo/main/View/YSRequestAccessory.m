//
//  YSRequestAccessory.m
//  Yoshop
//
//  Created by zhaowei on 16/5/28.
//  Copyright © 2016年 yoshop. All rights reserved.
//

#import "YSRequestAccessory.h"

@interface YSRequestAccessory ()
@property (nonatomic,weak) MBProgressHUD *hud;
@end

@implementation YSRequestAccessory
- (void)requestStart:(id)request {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading...";
    hud.removeFromSuperViewOnHide = YES;
    self.hud = hud;
}

- (void)requestStop:(id)request {
    [self.hud hide:YES];
}
@end

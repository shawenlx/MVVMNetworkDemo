//
//  Constants.h
//  Yoshop
//
//  Created by zhaowei on 16/5/25.
//  Copyright © 2016年 yoshop. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//App主站类型 0 : 测试   1 : 正式
#define ISENC @"0"
//App版本号
#define APPVIERSION @"APPVIERSION"
// 系统版本
#define DSYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 屏幕大小
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define DSCREEN_HEIGHT_SCALE SCREEN_HEIGHT / 568.0
#define DSCREEN_WIDTH_SCALE SCREEN_WIDTH / 320.0

#define IPHONE_4X_3_5 (SCREEN_HEIGHT==480.0f)

#define IPHONE_5X_4_0 (SCREEN_HEIGHT==568.0f)

#define IPHONE_6X_4_7 (SCREEN_HEIGHT==667.0f)

#define IPHONE_6P_5_5 (SCREEN_HEIGHT==736.0f || SCREEN_WIDTH==414.0f)

//字体加粗
#define FONT_BOLD @"Helvetica-Bold"

// 白颜色
#define YSCOLOR_WHITE [UIColor whiteColor]

// 颜色
#define YSCOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机颜色
#define YSCOLOR_RANDOM [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]

// Directory 目录
#define YSPATH_DIRECTORY [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// Cache 目录
#define YSPATH_CACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


//首页cell重用标识
#define HOME_CELL_INENTIFIER @"homeCell"

//H5页面跳转
typedef NS_ENUM(NSUInteger, SystemEnumURLType){
    SystemEnumURLTypeMethods = 0,
    SystemEnumURLTypeAbouts,
    SystemEnumURLTypePolicy,
    SystemEnumURLTypeWarranty,
    SystemEnumURLTypeTerms,
    SystemEnumURLTypeContact,
    SystemEnumURLTypeBanner
} ;

//用户性别 0 保密  1 男  2 女
typedef NS_ENUM(NSUInteger, UserEnumSexType){
    UserEnumSexTypeSecret = 0,
    UserEnumSexTypeMale,
    UserEnumSexTypeFemale
} ;

//用户是否通过验证  0 未通过  1 通过
typedef NS_ENUM(NSUInteger, UserEnumVerifyType){
    UserEnumVerifyTypeUnauthent = 0,
    UserEnumVerifyTypeAuthent
} ;

//        1，预售商品，图标 presale
//        2，预售前
//        4，到货通知，图标 arrival notice
//        5，Back order，图标 back order
//        6，限时限量，图标 flash sale
typedef NS_ENUM(NSUInteger, PresaleEnumType){
    PresaleEnumTypePresale = 1,
    PresaleEnumTypeBefore = 2,
    PresaleEnumTypeArrivalNotice = 4,
    PresaleEnumTypeBackOrder = 5,
    PresaleEnumTypeFlashSale = 6
} ;

typedef NS_ENUM(NSUInteger, CartStateEnumType){
    CartStateEnumTypeDefault = 0,
    CartStateEnumTypeAdd,
    CartStateEnumTypeUpdate,
    CartStateEnumTypeDelete,
    CartStateEnumTypeAll
} ;

typedef NS_ENUM(NSUInteger, CartAlertEnumType){
    CartAlertEnumTypeDefault = 0,
    CartAlertEnumTypeSameOrder,
    CartAlertEnumTypeDifferentWarehouse,
    CartAlertEnumTypeNoSelectItem,
    CartAlertEnumTypeNoAdderss,
    CartAlertEnumTypeSelectAdderss
} ;

typedef NS_ENUM(NSUInteger, CartCheckOutBackValueEnumType){
    CartCheckOutBackValueEnumTypeNoAddress = 0,
    CartCheckOutBackValueEnumTypeNoGoods,
    CartCheckOutBackValueEnumTypeOutSotck,
    CartCheckOutBackValueEnumTypeCannotShip,
    CartCheckOutBackValueEnumTypeSuccess
} ;

//YouTuBe
#define client_ID               @"440563634442-h7p6in2d0mu17ejj0am90u3pvfhpfeun.apps.googleusercontent.com"
#define client_Secret           @"AIzaSyDJg82UsRVPDmplm4XQshPLHrAm2Sz8W_A"
#define kKeychainItemName       @"YoutubeHelper"

#define kAppVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define kExchangeKey       @"kExchangeKey"
/**汇率*/
#define kRateName       @"kRateName"
#define kRateKey       @"kRateKey"
/**货币*/
#define kCurrencyKey       @"kCurrencyKey"
/**国别*/
#define kCountryKey       @"kCountryKey"
/**当前货币*/
#define kNowCurrencyKey       @"kNowCurrencyKey"
/**刷新购物车通知*/
static NSString * const kCartNotification   = @"kCartNotification";
/**刷新购物车通知*/
static NSString * const kCartNum   = @"kCartNum";
/**登陆通知*/
static NSString * const kLoginNotification  = @"kLoginNotification";
/**退出通知*/
static NSString * const kLogoutNotification = @"kLogoutNotification";
/**改变货币类型通知*/
static NSString * const kCurrencyNotification   = @"kCurrencyNotification";
/**检查refine中cell选中通知*/
static NSString * const kRefineNotification  = @"kRefineNotification";
/**检查refine中cell选中通知*/
static NSString * const kHomeRefineNotification  = @"kHomeRefineNotification";
/**主要用于用户信息本地存储*/
static NSString * const kDataKey            = @"kDataKey";
static NSString * const kFileName           = @"kFileName";
//static NSString* kKeychainItemName = @"YoutubeHelper";
//数据库名称
static NSString * const kDataBaseName           = @"database.db";
//数据库购物车表名称
static NSString * const kCartTableName           = @"t_cart";

//自定义Log
#ifdef DEBUG
#define YSLog(...) NSLog(__VA_ARGS__)
#else
#define YSLog(...)
#endif

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* Constants_h */

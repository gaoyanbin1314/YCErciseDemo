//
//  YCDefine.h
//  YCExercies
//
//  Created by 高艳彬 on 16/3/9.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#ifndef YCDefine_h
#define YCDefine_h
#endif /* YCDefine_h */

//调试打印
#ifdef DEBUG
#define DugLog(fmt, ...) NSLog((@"%s %04d \n" fmt), __func__, __LINE__, ##__VA_ARGS__)
#else
#define DugLog( s, ... )
#endif

//设备类型 iPhone iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//具体的iPhone类型
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_HEIGHT < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_HEIGHT == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_HEIGHT == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_HEIGHT == 736.0)


//iOS系统版本
#define IOS7_VERSION_LESS [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define IOS7_VERSION_LESS_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0f
#define IOS7_VERSION_MORE [[[UIDevice currentDevice] systemVersion] floatValue] > 7.0f
#define IOS7_VERSION_MORE_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f
#define IOS8_VERSION_LESS [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f
#define IOS8_VERSION_LESS_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] <= 8.0f
#define IOS8_VERSION_MORE [[[UIDevice currentDevice] systemVersion] floatValue] > 8.0f
#define IOS8_VERSION_MORE_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f
#define IOS9_VERSION_LESS [[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f
#define IOS9_VERSION_LESS_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] <= 0.0f
#define IOS9_VERSION_MORE [[[UIDevice currentDevice] systemVersion] floatValue] > 9.0f
#define IOS9_VERSION_MORE_OR_EQUAL [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f

//设备屏幕尺寸
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


//网络请求失败提示语
#define NOT_CONNECT_TO_INTERNET_PROMPT @"似乎已断开与互联网的连接"
#define TIME_OUT_PROMPT @"服务器连接超时"
#define CAN_NOT_CONNECT_TO_HOST_PROMPT @"未能连接到服务器"
#define CAN_NOT_FIND_HOST_PROMPT @"服务器内部错误"
#define UNKOWN_ERROR_PROMPT @"发生未知错误"

//
#define U_MENG_APPKEY       @"531931f756240bec2a0a43e4"
#define WECHAT_APPID        @"wx38c09320cc221e75"
#define WECHAT_APPSECRET    @"d67952382f4cc72b9ccece0da1cb8f4b"
#define QQ_APPID            @"1104609738"
#define QQ_APPKEY           @"alz2dkHNSkFFqy3q"
#define SHARE_URL           @"http://www.youxuanbao.cn"


//手势密码提示语
#define GESRURE_PASSWORD_SETTING            @"为了你账户的安全，请设置手势密码"
#define GESRURE_PASSWORD_UNLOCK             @"手势密码解锁!"
#define GESRURE_PASSWORD_SETTING_SUCCESS    @"恭喜您,手势密码设置成功!"
#define GESRURE_PASSWORD_SETTING_FAILTURE   @"设置失败,请重新输入!"
#define GESRURE_PASSWORD_UNLOCK_SUCCESS     @"恭喜您,解锁成功!"
#define GESRURE_PASSWORD_UNLOCK_FAILTURE    @"解锁失败"
#define GESTURE_PASSWORD_COUNT_PROMPT       @"至少连接四个点!"


//空间圆角半径
#define CORNERRADIUS        2
//左右边距
#define LEFT_RIGHT_MARGIN   15
//文本框文字字号
#define textFieldTextFont   16


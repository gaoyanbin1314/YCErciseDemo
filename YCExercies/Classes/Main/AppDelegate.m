//
//  AppDelegate.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "AppDelegate.h"

#import "YCTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    
//    推送通知
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.0) {
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }else{
    
        UIRemoteNotificationType type = (UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound);
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:type];
        
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    YCTabBarViewController *tabBarVC = [[YCTabBarViewController alloc] init];
    tabBarVC.tabBar.translucent      = NO;
    self.window.rootViewController   = tabBarVC;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

// 推送成功 失败的 代理方法

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{

    NSLog(@"************\n 注册通知失败 原因： %@",error);
}
// 获取推送成功
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //    [self markRemoteMessageRead:userInfo];
    NSLog(@"************\n 接受通知成功 %@",userInfo);
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{

}

// 获取 device Tokenc
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    NSLog(@"************\n 获取device token成功 %@",deviceToken);

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}





@end

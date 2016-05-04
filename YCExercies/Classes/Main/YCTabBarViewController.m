//
//  YCTabBarViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCTabBarViewController.h"

#import "YCObject-CViewController.h"
#import "YCAnimationController.h"
#import "YCLayerViewController.h"
#import "YCSwiftViewController.h"


@interface YCTabBarViewController ()

@end

@implementation YCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    YCObject_CViewController *objectVC = [[YCObject_CViewController alloc] init];
    [self addChildViewController:objectVC
                           title:@"Object-C"
                           image:[UIImage imageNamed:@"tabbar_discover"]
                     selectImage:[[UIImage imageNamed:@"tabbar_discover_selected"]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    YCAnimationController   *animateVC = [[YCAnimationController alloc] init];
    [self addChildViewController:animateVC
                           title:@"Animation"
                           image:[UIImage imageNamed:@"tabbar_message_center"]
                     selectImage:[[UIImage imageNamed:@"tabbar_message_center_selected"]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    
    YCLayerViewController *layerVC = [[YCLayerViewController alloc] init];
    [self addChildViewController:layerVC
                           title:@"Layer"
                           image:[UIImage imageNamed:@"tabbar_home"]
                     selectImage:[[UIImage imageNamed:@"tabbar_home_selected"]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    YCSwiftViewController *swiftVC = [[YCSwiftViewController alloc] init];
    [self addChildViewController:swiftVC
                           title:@"Swift"
                           image:[UIImage imageNamed:@"tabbar_profile"]
                     selectImage:[[UIImage imageNamed:@"tabbar_profile_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    
    
    
}

-(void)addChildViewController:(UIViewController *)childController
                        title:(NSString *)title
                        image:(UIImage *)image
                  selectImage:(UIImage *)selectImage{

    //标题e
    childController.title = title;
    childController.view.backgroundColor = [UIColor whiteColor];

    //tabBarItem图片    
    childController.tabBarItem.image         = image;
    childController.tabBarItem.selectedImage = selectImage;

    //tabBarItem字体的设置
    NSDictionary *normolText = @{NSForegroundColorAttributeName:[UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0]};
    [childController.tabBarItem setTitleTextAttributes:normolText forState:UIControlStateNormal];
    
    NSDictionary *selectText = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    [childController.tabBarItem setTitleTextAttributes:selectText forState:UIControlStateSelected];
    
    //导航控制器
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navi];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

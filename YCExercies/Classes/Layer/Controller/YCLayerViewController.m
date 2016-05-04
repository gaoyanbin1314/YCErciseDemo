//
//  YCLayerViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCLayerViewController.h"

@interface YCLayerViewController ()

@end

@implementation YCLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.navigationBar.translucent = NO;
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400)];
    tableview.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableview];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"test" forKey:@"com"];
    
//    NSString *messa = [NSString stringWithFormat:NSLocalizedString(@"com%@", nil)];
//    NSLog(@"************\n%@",messa);
    
//    国家化
//    NSLocalizedString(<#key#>, <#comment#>)
//    获取本地有几种语言
//    NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
//    NSLog(@"************\n%@",languages);
    
    
    
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

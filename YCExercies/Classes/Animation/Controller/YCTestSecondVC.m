//
//  YCTestSecondVC.m
//  YCExercies
//
//  Created by 高艳彬 on 16/2/23.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCTestSecondVC.h"

@interface YCTestSecondVC ()

@end

@implementation YCTestSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    button.center    = self.view.center;
    button.backgroundColor = [UIColor greenColor];
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)back:(UIButton *)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
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

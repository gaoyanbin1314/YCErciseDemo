//
//  YCDrawerAnimation.m
//  YCExercies
//
//  Created by 高艳彬 on 16/2/23.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCDrawerAnimation.h"
#import "YCCustomModalTransition.h"
#import "YCTestSecondVC.h"


@interface YCDrawerAnimation ()

@property(nonatomic,strong) YCCustomModalTransition    *transitioned;

@end

@implementation YCDrawerAnimation

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    button.center    = self.view.center;
    
    button.backgroundColor = [UIColor greenColor];
    
    [button setTitle:@"抽屉转场动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
 
    [self.view addSubview:button];
    
}

-(void)buttonClick:(UIButton *)sender{
    
//    ---初始化要弹出跳转的视图控制器
    YCTestSecondVC *modalVC = [YCTestSecondVC new];
    //---必须强引用，否则会被释放，自定义dismiss的转场无效
    self.transitioned = [[YCCustomModalTransition alloc]initWithModalViewController:modalVC];
    self.transitioned.dragable = YES;//---是否可下拉收起
    modalVC.transitioningDelegate = self.transitioned;
    //---必须添加这句.自定义转场动画
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
    
    
    
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

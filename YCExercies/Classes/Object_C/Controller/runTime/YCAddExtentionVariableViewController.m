
//
//  YCAddExtentionVariableViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCAddExtentionVariableViewController.h"
#import "YCXiaoMing+AddVariable.h"


@interface YCAddExtentionVariableViewController ()

@property(nonatomic,strong) YCXiaoMing    *xiaoMing;
@end

@implementation YCAddExtentionVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.xiaoMing = [[YCXiaoMing alloc] init];
    self.xiaoMing.englishName = @"loneDog";
    self.xiaoMing.chineseName = @"xiaoMing";
    
    NSLog(@"his chinese name is %@",self.xiaoMing.chineseName);

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.center    = self.view.center;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"添加属性" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

-(void)addExtentionVariable{

    NSLog(@"分类添加属性 实现 %@",self.xiaoMing.englishName);

}

-(void)buttonClick:(UIButton *)sender{

    [self addExtentionVariable];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
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

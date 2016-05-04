//
//  YCChageVariableViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/28.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCChageVariableViewController.h"
#import "YCXiaoMing.h"
#import <objc/runtime.h>

@interface YCChageVariableViewController ()

@property(nonatomic,strong)YCXiaoMing     *xiaoMing;
@end

@implementation YCChageVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.center    = self.view.center;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"修改变量值" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:button];
    self.xiaoMing = [YCXiaoMing new];
    self.xiaoMing.chineseName = @"xiaoMing";
    NSLog(@"************\nname %@",self.xiaoMing.chineseName);
    
    
}

-(void)answer{

    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self.xiaoMing class], &count);
    for (int i = 0; i < count; i ++) {
        
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *name = [NSString stringWithUTF8String:varName];
    
        if ([name isEqualToString:@"_chineseName"]) {
            object_setIvar(self.xiaoMing, var, @"loneDog");
            break;
        }
    }
    NSLog(@"************\nchangeName %@",self.xiaoMing.chineseName);
    
}


-(void)buttonClick:(UIButton *)sender{

    [self answer];

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

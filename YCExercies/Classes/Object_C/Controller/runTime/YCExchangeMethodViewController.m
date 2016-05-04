//
//  YCExchangeMethodVC.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/28.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCExchangeMethodViewController.h"
#import "YCXiaoMing.h"
#import <objc/runtime.h>
@interface YCExchangeMethodViewController ()

@property(nonatomic,strong)YCXiaoMing     *xiaoMing;

@end

@implementation YCExchangeMethodViewController

-(YCXiaoMing *)xiaoMing{
    if (!_xiaoMing) {
        _xiaoMing = [[YCXiaoMing alloc] init];
    }
    return _xiaoMing;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.backgroundColor = [UIColor greenColor];
    button.center          = self.view.center;
    [button setTitle:@"交换方法" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSLog(@"************\n交换前 输出：%@",[self.xiaoMing firstMethod]);
    
}

-(void)exchangeMethod{

    Method method1 = class_getInstanceMethod([self.xiaoMing class], @selector(firstMethod));
    Method method2 = class_getInstanceMethod([self.xiaoMing class], @selector(secendMethod));

    
    method_exchangeImplementations(method2, method1);
    NSLog(@"************\n交换方法后 输出 : %@",[self.xiaoMing firstMethod]);
    
}

-(void)buttonClick:(UIButton *)sender{
 
    [self exchangeMethod];

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

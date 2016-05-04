//
//  YCAddMethodViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/28.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCAddMethodViewController.h"
#import "YCXiaoMing.h"
#import <objc/runtime.h>

@interface YCAddMethodViewController ()

@property(nonatomic,strong) YCXiaoMing    *xiaoMing;

@end

@implementation YCAddMethodViewController

-(YCXiaoMing *)xiaoMing{
    if (!_xiaoMing) {
        _xiaoMing = [[YCXiaoMing alloc] init];
    }
    return _xiaoMing;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.center    = self.view.center;
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"添加方法" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)addMethod{

    class_addMethod([self.xiaoMing class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([self.xiaoMing respondsToSelector:@selector(guess)]) {
     
        [self.xiaoMing performSelector:@selector(guess)];
    }else{
    
       NSLog(@"************\nHe dont Known");
    }

}
-(void)guess{

    NSLog(@"fafa");
}

void guessAnswer (id self,SEL _cmd){

    NSLog(@"************\nHe conmes from guangdong");

}

-(void)buttonClick:(UIButton *)sender{

    [self addMethod];

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

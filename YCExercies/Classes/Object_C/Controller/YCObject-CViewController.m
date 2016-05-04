//
//  YCObject-CViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCObject-CViewController.h"
//#import <objc/runtime.h>


@interface YCObject_CViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray    *controllers;

@end

@implementation YCObject_CViewController

-(NSArray *)controllers{
    if (!_controllers) {
        _controllers = [[NSArray alloc] init];
        _controllers = @[@"YCRunTimeLearnVC",@"YCTextFieldViewC",@"YCTableViewVC",@"YCRegularViewController"];
    }
    return _controllers;
}


- (void)viewDidLoad {
 

//    self.automaticallyAdjustsScrollViewInsets = NO;
    CGRect frame = self.view.frame;
    frame.origin.y    = 0;
    frame.size.height = self.view.frame.size.height - 64 - 50;
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate       = self;
    tableView.dataSource     = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:tableView];
    
    
}

#pragma mark --- UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.controllers.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = @"oc-cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.controllers[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    return  cell;

}

#pragma mark --- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *className = self.controllers[indexPath.row];
    Class class = NSClassFromString(className);
    
    UIViewController *controller = (UIViewController *)[[class alloc] init];
    controller.title             = className;
    controller.view.backgroundColor     = [UIColor whiteColor];
    controller.navigationController.navigationBar.translucent = NO;
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    
   

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

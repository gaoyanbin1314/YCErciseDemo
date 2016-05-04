//
//  YCRunTimeLearnVC.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/28.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCRunTimeLearnVC.h"

@interface YCRunTimeLearnVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray    *controllers;
@end

@implementation YCRunTimeLearnVC

-(NSArray *)controllers{
    if (!_controllers) {
        _controllers = [[NSArray alloc] init];
        _controllers = @[@"YCChageVariableViewController",@"YCExchangeMethodViewController",
                         @"YCAddMethodViewController",@"YCAddExtentionVariableViewController"];
    }
    return _controllers;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.delegate     = self;
    tableView.dataSource   = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.view addSubview:tableView];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.controllers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.controllers[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;

}
#pragma mark --- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *className     = self.controllers[indexPath.row];
    Class class             = NSClassFromString(className);
    UIViewController *vc    = (UIViewController *)[[class alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}



-(void)leftItemClick:(UIButton *)sender{

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

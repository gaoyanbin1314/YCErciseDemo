//
//  YCAnimationController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCAnimationController.h"

@interface YCAnimationController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray    *controlls;

@end

@implementation YCAnimationController


-(NSArray *)controlls{
    if (!_controlls) {
        _controlls = [[NSArray alloc] init];
        _controlls = @[@"YCDrawerAnimation",@"YCGraphics01"];
        
        
    }
    return _controlls;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;

    CGRect frame = self.view.frame;
    frame.origin.y    = 64;
    frame.size.height = self.view.frame.size.height - 49 - 64;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate   = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:tableView];
    
    
    
    
  //  [self initUI];
    
    
  //  objc_msgSend(self.loginB,@selector(initUI));

    
    
}

#pragma mark --- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.controlls.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier  = @"animation-cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.controlls[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}
#pragma mark --- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *className  = self.controlls[indexPath.row];
    Class class          = NSClassFromString(className);
    UIViewController *vc = [(UIViewController *)[class alloc] init];
    vc.title             = className;
    
    [self.navigationController pushViewController:vc animated:YES];
    
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

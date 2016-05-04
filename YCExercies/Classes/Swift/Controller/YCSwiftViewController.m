//
//  YCSwiftViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCSwiftViewController.h"

@interface YCSwiftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray    *messages;

@end

@implementation YCSwiftViewController

static NSString *identifier = @"cell";

-(NSMutableArray *)messages{
    if (!_messages) {
        
        NSArray *array = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个",@"第七个",@"第八个"];
        
        _messages = [NSMutableArray arrayWithArray:array];
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationController.navigationBar.translucent = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];

//    [tableView dequeueReusableCellWithIdentifier:identifier];
    tableView.delegate     = self;
    tableView.dataSource   = self;

    [tableView setEditing:YES animated:YES];
    [self.view addSubview:tableView];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.messages.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"text - %ld - %ld",indexPath.section,indexPath.row];
    return cell;

}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{


    return proposedDestinationIndexPath;

}

-(UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 2) {
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.messages removeObjectAtIndex:indexPath.row];
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];
        
    }

}


-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewRowAction *delegate = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除 00" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       
        [self.messages removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
    }];
    
    UITableViewRowAction *add = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"添加" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.messages addObject:@"第九天"];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }];
    
    return @[delegate,add];
    
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

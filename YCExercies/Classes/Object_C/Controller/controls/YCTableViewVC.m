//
//  YCTableViewVC.m
//  YCExercies
//
//  Created by 高艳彬 on 16/3/9.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCTableViewVC.h"

@interface YCTableViewVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView    *tableView;

@property(nonatomic,strong) NSMutableArray    *messages;

@end

@implementation YCTableViewVC

static NSString *identifier = @"TableViewCell";


-(NSMutableArray *)messages{
    if (!_messages) {
        _messages = [[NSMutableArray alloc] init];
        NSArray *array = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个",@"第七个",@"第八个"];
        [_messages addObjectsFromArray:array];
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit:)];
    
    
    
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    tableview.delegate     = self;
    tableview.dataSource   = self;
    
    self.tableView         = tableview;
    
    [self.view addSubview:tableview];
    
    
    
}
-(void)edit:(UIBarButtonItem *)sender{

    self.tableView.editing = YES;
}

#pragma mark --- UITableViewDataSource

//每个section下cell的个数（必须实现）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.messages.count;
}

//通过indexpath返回具体的cell（必须实现）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.messages[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDetailButton;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.selectedBackgroundView.backgroundColor = [UIColor redColor];
    return cell;
    
}

//@optional
//返回有多少个section（默认是1）
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 12;
    
}
  //每个section上面的标语内容
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [NSString stringWithFormat:@"section:%ld header:%ld",section,section];
}
// fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return [NSString stringWithFormat:@"section:%ld footer:%ld",section,section];

}
// 是否可拖拽
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    return YES;
//}

// Editing

//是否可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

// Moving/reordering



// Index
//右侧索引条需要的数组内容
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView __TVOS_PROHIBITED{

    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    return array;
    
}
// 对Cell拖拽后的回调
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

//索引值对应的section-index
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index __TVOS_PROHIBITED{

    return index;
}

// 对Cell编辑后的回调
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    editingStyle = UITableViewCellEditingStyleInsert;
//}


// --  --  --  --  --  --  UITableViewDelegate  --   --  --  --  --  --  -- //

#pragma mark --- UITableViewDelegate

// 点击cell时的响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"************\n 点击了%@",indexPath);
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType != UITableViewCellAccessoryCheckmark) {
        cell.accessoryType  = UITableViewCellAccessoryCheckmark;
    }else{
    
        cell.accessoryType  = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

    return @"删除cell";
}

// 左划出现的功能 自定义
//-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    UITableViewRowAction *delegate = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        
//        NSLog(@"************\n删除");
//        [self.messages removeObjectAtIndex:indexPath.row];
//        
//        
//        
//        
////        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//        
//    }];
//    
//    UITableViewRowAction *edit = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"************\n编辑");
//    }];
//    
//    UITableViewRowAction *setTop = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"************\n置顶");
//    }];
//    setTop.backgroundColor = [UIColor greenColor];
//    
//    return @[setTop,delegate,edit];
//}
//
//将要展示Cell/header/Footer视图回调
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"************\n 开始展示cell");
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{

    NSLog(@"************\n展示HeaderView");
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
  
    NSLog(@"************\n展示footview");
}


//完成展示Cell/header/Footer视图回调
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0){

        NSLog(@"************\n 结束展示cell");
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){

        NSLog(@"************\n 结束展示HeaderView");
}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){

        NSLog(@"************\n 结束展示FooterView");
}

// Variable height support
// 每个cell高度的返回(这里高度通过协议返回，是为了table能准确的定位出要显示的Cell-index，从而满足UITableView的重用机制)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 40;
}
// 每个section-header高度的返回
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}
// 每个section-footer高度的返回
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 30;
}

//custom view for header. will be adjusted to default or specified header height
//可返回每个section-header的自定义视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section == 1) {
        
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        header.backgroundColor = [UIColor greenColor];
        return header;
    }else{
    
        return nil;
    }
}
// custom view for footer. will be adjusted to default or specified footer height
//可返回每个section-footer的自定义视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (section == 1) {
        
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        footer.backgroundColor = [UIColor redColor];
        return footer;
    }else{
        
        return nil;
    }
}


// Selection

// Cell高亮的回调，一般式在选择的时候才高亮
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){

    if(indexPath.row == 1 ){  // row ＝＝ 1 的cell 不能点击
        
        return NO;
    }else{
    
        return YES;
    }
    
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){

    NSLog(@"************\n didHighlight%@",indexPath);
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){

    NSLog(@"************\n unHeight %@",indexPath);
}

// Cell选中和取消选择的回调
/*
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 选中的cell
    return [NSIndexPath indexPathForRow:3 inSection:1];

}
*/
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){

    // 设置的indexpath 会有取消选中的效果 其它的如果被选中就保持选中状态
    return indexPath;
    
}
// Called after the user changes the selection.

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
//
//    
//}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){

}

#pragma mark --- editing

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
     

        [self.messages removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        

    }
    
}
// 是否 可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

// 设置 cell 的 accessoryType
-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellAccessoryCheckmark;
}
// cell的accessorytype 的 accessoryDetailButton时 点击按钮的响应事件
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"************\naccessoryButtonTapped");

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end

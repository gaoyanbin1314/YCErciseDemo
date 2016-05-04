//
//  YCTextFieldViewC.m
//  YCExercies
//
//  Created by 高艳彬 on 16/3/4.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCTextFieldViewC.h"

@interface YCTextFieldViewC ()<UITextFieldDelegate>

@end

@implementation YCTextFieldViewC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 30)];
    textField.delegate     = self;
    [self.view addSubview:textField];
    
    
    textField.placeholder   = @"提示内容";
    textField.font          = [UIFont fontWithName:@"Arial" size:20];
    textField.textColor     = [UIColor greenColor];
    textField.textAlignment = NSTextAlignmentCenter;

//    textField.background = [UIImage imageNamed:@"beijing-1"];
    
    //设置边框样式，只有设置了才会显示边框样式
    textField.borderStyle = UITextBorderStyleLine;

    // 边界设置
    textField.layer.borderColor = [UIColor redColor].CGColor;
    textField.layer.borderWidth = 1.0;

    //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
    //每输入一个字符就变成点 用语密码输入 yes 强制调取苹果安全键盘
    textField.secureTextEntry  = NO;

    //再次编辑就清空
    textField.clearsOnBeginEditing = YES;
    
    //内容的垂直对齐方式  UITextField继承自UIControl,此类中有一个属性contentVerticalAlignment
    textField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    textField.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;

    //设置为YES时文本会自动缩小以适应文本窗口大小.默认是保持原来大小,而让长文本滚动
    textField.adjustsFontSizeToFitWidth = YES;

    //设置自动缩小显示的最小字体大小
    textField.minimumFontSize = 20;
    
    //设置键盘的样式
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    
    //首字母是否大写
    textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    
    //是否纠错
    textField.autocorrectionType     = UITextAutocorrectionTypeNo;
    
    //键盘外观
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    //键盘上添加提示等内容
    UIView *keyboardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 40)];
    keyboardView.backgroundColor = [UIColor greenColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, keyboardView.frame.size.width, 20)];
    label.text     = @"自定义添加内容";
    label.font     = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [keyboardView addSubview:label];
    
    [textField setInputAccessoryView:keyboardView];
    
    //取代弹出键盘的
    UIDatePicker *datePicker  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    //设置时区
    datePicker.locale         = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    textField.inputView       = datePicker;
    
    //最右侧加图片是以下代码   左侧类似
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_discover_selected"]];
    textField.rightView = imageView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    
}

#pragma mark --- UITextFiekdDelegate
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //返回一个BOOL值，指定是否循序文本字段开始编辑
    // NO 则不会弹出键盘 不会进入编辑状态 可以接自定义的弹出键盘
    
    return YES;
}

// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{

    //已经开始编辑状态
}

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    // YES 允许结束编辑状态，并放弃第一响应者
    // NO  不允许结束编辑状态
    return YES;
}

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField{

    //
}

// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

//    textField.text = @"fasfasf";
    // NO 不会输入字符
    return YES;
}

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldClear:(UITextField *)textField{

    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    //  键盘上 return键点击后的处理
    NSLog(@"************\n点击return");
    return YES;
}



//重写绘制行为
//除了UITextField对象的风格选项，你还可以定制化UITextField对象，为他添加许多不同的重写方法，来改变文本字段的显示行为。这些方法都会返回一个CGRect结构，制定了文本字段每个部件的边界范围。以下方法都可以重写。
//
//– textRectForBounds:　　    // 重写来重置文字区域
//– drawTextInRect:　　       // 改变绘文字属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
//– placeholderRectForBounds:　　//重写来重置占位符区域
//– drawPlaceholderInRect:　　//重写改变绘制占位符属性.重写时调用super可以按默认图形属性绘制,若自己完全重写绘制函数，就不用调用super了.
//– borderRectForBounds:　　//重写来重置边缘区域
//– editingRectForBounds:　　//重写来重置编辑区域
//– clearButtonRectForBounds:　　//重写来重置clearButton位置,改变size可能导致button的图片失真
//– leftViewRectForBounds:
//– rightViewRectForBounds:



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

//内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
    
}


@end

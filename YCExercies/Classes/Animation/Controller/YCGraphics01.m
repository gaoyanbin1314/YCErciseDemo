//
//  YCGraphics01.m
//  YCExercies
//
//  Created by 高艳彬 on 16/2/23.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCGraphics01.h"

@interface YCGraphics01 ()

@end

@implementation YCGraphics01

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}


-(void)initUI{

//    YCGraphics *graphics = [[YCGraphics alloc] initWithFrame:CGRectMake(10, 64, 100, 100)];
//    graphics.backgroundColor  = [UIColor whiteColor];
//
//
//
//
//    [self.view addSubview:graphics];

//method5
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [[UIColor blueColor] setFill];
//    [path fill];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

//method6
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100));
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextFillPath(context);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

//
//    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
//    imageview.image = image;
//    [self.view addSubview:imageview];

//图片平移画图片
UIImage *image = [UIImage imageNamed:@"xianqianbao"];
CGSize   size  = image.size;

//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 3, size.height), NO, 0);
//    [image drawAtPoint:CGPointMake(0, 0)];
//    [image drawAtPoint:CGPointMake(size.width, 0)];
//    [image drawAtPoint:CGPointMake(size.width * 2, 0)];
//    UIImage *translationImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

// 缩放图片

//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 2, size.height * 2), NO, 0);
//
//    [image drawInRect:CGRectMake(0, 0, size.width * 2, size.height * 2)];
//
//    [image drawInRect:CGRectMake(size.width/2, size.height/2, size.width, size.height) blendMode:kCGBlendModeMultiply alpha:1.0];
//    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

// 剪切图片 操作起点 实现
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width/2, size.height), NO, 0);
//    [image drawAtPoint:CGPointMake(-size.width/2, 0)];
//    UIImage *halfImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();



// UIImage 与 UIGraphics 相互转换  UIImage CGImage
// 多分辨率下 size会变化  image imagewithname： 会自动适配 但是 cgimage 不会自动适配
CGImageRef imageRef = [image CGImage];
CGSize     sizeRef  = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));

// 图片大小
CGImageRef imageLeft = CGImageCreateWithImageInRect(imageRef, CGRectMake(0, 0, sizeRef.width/2, sizeRef.height));
CGImageRef imageRighr = CGImageCreateWithImageInRect(imageRef, CGRectMake(sizeRef.width/2, 0, sizeRef.width/2, sizeRef.height));


UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 1.5, size.height), NO, 0);


// 图片会倒置
//    CGContextRef context = UIGraphicsGetCurrentContext();
//   CGContextDrawImage(context, CGRectMake(0, 0, size.width/2, size.height), imageLeft);
////    CGContextDrawImage(context, CGRectMake(size.width, 0, size.width/2,size.height ),
////                       imageRighr);
//
//    // 图片扶正  修正method1
////    CGContextDrawImage(context, CGRectMake(0, 0, size.width/2, size.height), filp(imageLeft));
//    CGContextDrawImage(context, CGRectMake(size.width, 0, size.width/2, size.height), filp(imageRighr));

// 图片扶正  修正method2
[[UIImage imageWithCGImage:imageLeft scale:[image scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(0, 0)];
[[UIImage imageWithCGImage:imageRighr scale:[image scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(size.width, 0)];


UIImage *imageContext = UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
//释放内存 arc在此处无效
CGImageRelease(imageLeft);
CGImageRelease(imageRighr);



UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100,size.width * 1.5, size.height)];
imageView.image = imageContext;
[self.view addSubview:imageView];


}
//将倒置图片扶正 由于坐标系多原点位置不同 导致 图片倒置
CGImageRef filp (CGImageRef imageRef){
    
    CGSize size = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height), imageRef);
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    UIGraphicsEndImageContext();
    return result;
    
    
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

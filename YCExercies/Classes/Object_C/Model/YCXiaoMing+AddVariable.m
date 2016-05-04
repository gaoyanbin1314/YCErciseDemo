//
//  YCXiaoMing+AddVariable.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCXiaoMing+AddVariable.h"
#import <objc/runtime.h>

// 第一，XCode运行你在Category的.h文件申明@Property，编译通过，但运行时如果没有Runtime处理，进行赋值取值，就马上报错。第二，这一点是iOS面试当中经常面到的问题：如何给扩展添加属性？


@implementation YCXiaoMing (AddVariable)

char name;

-(void)setEnglishName:(NSString *)englishName{

    objc_setAssociatedObject(self, &name, englishName, OBJC_ASSOCIATION_COPY_NONATOMIC);

}

-(NSString *)englishName{
    
    return objc_getAssociatedObject(self, &name);
}





@end

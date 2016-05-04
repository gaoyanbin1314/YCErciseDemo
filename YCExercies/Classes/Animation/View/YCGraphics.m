//
//  YCGraphics.m
//  YCExercies
//
//  Created by 高艳彬 on 16/1/27.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCGraphics.h"



@implementation YCGraphicsDelegate

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    UIGraphicsPushContext(ctx);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor blueColor] setFill];
    
    [bezier fill];
    UIGraphicsPopContext();
    
}

@end
@interface YCGraphics(){
    
    YCGraphicsDelegate    *_layerGraphicsDelegate;
}


@end

@implementation YCGraphics

//-(instancetype)initWithFrame:(CGRect)frame{
//
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        self = [[YCGraphics alloc] initWithFrame:frame];
//        CALayer    *mylayer = [CALayer layer];
//        _layerGraphicsDelegate = [[YCGraphicsDelegate alloc] init];
//        mylayer.delegate       = _layerGraphicsDelegate;
//        [self.layer addSublayer:mylayer];
//        [self setNeedsDisplay];
//        
//    }
//
//    return self;
//}

-(void)drawRect:(CGRect)rect{

   // method1
//    UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [[UIColor blueColor] setFill];
//    [bezier fill];

    // method2
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100));
//    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
//    
//    CGContextFillPath(context);


    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

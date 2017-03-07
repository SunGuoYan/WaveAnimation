//
//  ViewController.m
//  wave
//
//  Created by SunGuoYan on 16/12/2.
//  Copyright © 2016年 SunGuoYan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
//    [self nextAnimation];
//    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextAnimation) userInfo:nil repeats:YES];
    
//    [self nextAnimation];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextAnimation) userInfo:nil repeats:YES];
    
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:0.5];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:1.0];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:1.5];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:2.0];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:2.5];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:3.0];
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:3.5];
    
    view=[[UIView alloc]initWithFrame:CGRectMake(150, 150, 100, 100)];
    view.backgroundColor=[UIColor cyanColor];
    view.layer.cornerRadius=50;
    view.layer.masksToBounds=YES;
    
    
}
-(void)nextAnimation{
    
    //圆形变圆弧
    CAShapeLayer * clickCicrleLayer = [CAShapeLayer layer];
    
    clickCicrleLayer.frame = CGRectMake(200, 200, 50,50);
    
    clickCicrleLayer.fillColor = [UIColor colorWithRed:0.5 green:0.51 blue:0.9 alpha:1].CGColor;
//    clickCicrleLayer.strokeColor = [UIColor whiteColor].CGColor;
    clickCicrleLayer.lineWidth = 2;
    clickCicrleLayer.path=[self drawclickCircleBezierPath:1].CGPath;
    [self.view.layer addSublayer:clickCicrleLayer];
    
    [self.view addSubview:view];
//    [view.layer addSublayer:clickCicrleLayer];
    
    //圆弧变大
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 4.0;
        basicAnimation.toValue = (__bridge id _Nullable)([self drawclickCircleBezierPath:(100)].CGPath);
//    basicAnimation.toValue = (__bridge id _Nullable)([self drawclickCircleBezierPath:([UIScreen mainScreen].bounds.size.width)].CGPath);
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    
    
    //变透明
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation1.toValue = @0;
    basicAnimation1.beginTime = 0.00;
    basicAnimation1.duration = 4.0;
    basicAnimation1.removedOnCompletion = NO;
    basicAnimation1.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[basicAnimation,basicAnimation1];
    
    animationGroup.repeatCount=0;
//    animationGroup.repeatCount=MAXFLOAT;
    animationGroup.duration = basicAnimation1.beginTime + basicAnimation1.duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    
    [clickCicrleLayer addAnimation:animationGroup forKey:nil];
    
//    [self performSelector:@selector(nextAnimation) withObject:self afterDelay:0.8];
}
-(UIBezierPath *)drawclickCircleBezierPath:(CGFloat)radius{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    /**
     *  center: 弧线中心点的坐标
     radius: 弧线所在圆的半径
     startAngle: 弧线开始的角度值
     endAngle: 弧线结束的角度值
     clockwise: 是否顺时针画弧线
     *
     */
    [bezierPath addArcWithCenter:CGPointMake(0,0) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    return bezierPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

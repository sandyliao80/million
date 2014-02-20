//
//  LuckyViewController.m
//  million
//
//  Created by 陈浩 on 14-2-15.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "LuckyViewController.h"

@interface LuckyViewController ()

@end

@implementation LuckyViewController
{
    float random;
    float orign;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.wheelImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disk.jpg"]];
    self.wheelImage.frame = CGRectMake(0.0, 130.0, 320.0, 320.0);
    [self.view addSubview:self.wheelImage];
    
    self.pointImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"start.png"]];
    self.pointImage.frame = CGRectMake(103.0, 185.0, 120.0, 210.0);
    self.pointImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [self.pointImage addGestureRecognizer:tap];
    [self.view addSubview:self.pointImage];
}

- (void) imageTap:(UIGestureRecognizer *) gesture
{
    //******************旋转动画******************
    //产生随机角度
    srand((unsigned)time(0));  //不加这句每次产生的随机数不变
    random = (rand() % 20) / 10.0;
    //设置动画
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI * (0.0+orign)]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * (10.0+random+orign)]];
    [spin setDuration:2.5];
    [spin setDelegate:self];//设置代理，可以相应animationDidStop:finished:函数，用以弹出提醒框
    //速度控制器
    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    //添加动画
    [[self.pointImage layer] addAnimation:spin forKey:nil];
    //锁定结束位置
    self.pointImage.transform = CGAffineTransformMakeRotation(M_PI * (10.0+random+orign));
    //锁定fromValue的位置
    orign = 10.0+random+orign;
    orign = fmodf(orign, 2.0);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //判断抽奖结果
    if (orign >= 0.0 && orign < (0.5/3.0)) {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 一等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }
    else if (orign >= (0.5/3.0) && orign < ((0.5/3.0)*2))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)*2) && orign < ((0.5/3.0)*3))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 六等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+0.5) && orign < ((0.5/3.0)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+0.5) && orign < (((0.5/3.0)*2)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 五等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+0.5) && orign < (((0.5/3.0)*3)+0.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+1.0) && orign < ((0.5/3.0)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 四等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+1.0) && orign < (((0.5/3.0)*2)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+1.0) && orign < (((0.5/3.0)*3)+1.0))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 三等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (0.0+1.5) && orign < ((0.5/3.0)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= ((0.5/3.0)+1.5) && orign < (((0.5/3.0)*2)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 二等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }else if (orign >= (((0.5/3.0)*2)+1.5) && orign < (((0.5/3.0)*3)+1.5))
    {
        UIAlertView *result = [[UIAlertView alloc] initWithTitle:@"恭喜中奖！" message:@"您中了 七等奖！ " delegate:self cancelButtonTitle:@"领奖去！" otherButtonTitles: nil];
        [result show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

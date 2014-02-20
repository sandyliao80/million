//
//  MainViewController.h
//  million
//
//  Created by 陈浩 on 14-2-5.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"

@interface MainViewController : UIViewController 

@property (nonatomic, strong) UIViewController *menuVC;

@property (nonatomic, strong) UINavigationController *nav;

@property (nonatomic,strong) MainView *mainView;

@end

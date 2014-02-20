//
//  MainViewController.m
//  million
//
//  Created by 陈浩 on 14-2-5.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "MainViewController.h"

#define MAX_CENTER_X 420
#define BOUND_X 280

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    //self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.menuVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"SidebarStoryboard"];
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"align.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(ggg:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    self.navigationItem.leftBarButtonItem = menuItem;
    self.navigationItem.title = @"百万富翁";
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
    
    //[self.menuVC.view setTransform:CGAffineTransformMakeScale(0.8, 1)];
    //self.menuVC.view.center = CGPointMake(-160, 284);
    self.menuVC.view.frame = CGRectMake(0, 0, 320, 568);
    
    [self.view addSubview: self.menuVC.view];
    self.mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.mainView.button1 addTarget:self action:@selector(huhu:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.button2 addTarget:self action:@selector(knowledge:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.button3 addTarget:self action:@selector(lucky:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mainView];
}

- (void) ggg:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^(void){
        
        if (self.mainView.center.x == self.mainView.centerX) {
            self.mainView.center = CGPointMake(MAX_CENTER_X, self.mainView.centerY);
            [self.navigationController.navigationBar setTransform:CGAffineTransformMakeTranslation(260, 0)];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            tap.cancelsTouchesInView = NO;
            //tap.delegate = self;
            [self.mainView addGestureRecognizer:tap];
            [self.mainView.button1 setUserInteractionEnabled:NO];
            [self.mainView.button3 setUserInteractionEnabled:NO];
            //self.menuVC.view.center = CGPointMake(100, 284);
            //[self.menuVC.view setTransform:CGAffineTransformMakeTranslation(16, 0)];
        }else if (self.mainView.center.x == MAX_CENTER_X){
            self.mainView.center = CGPointMake(self.mainView.centerX, self.mainView.centerY);
            [self.navigationController.navigationBar setTransform:CGAffineTransformMakeTranslation(0, 0)];
            //self.menuVC.view.center = CGPointMake(-160, 284);
        }
        
    }];
    
}

- (void) tap:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^(void){
        self.mainView.center = CGPointMake(self.mainView.centerX, self.mainView.centerY);
        [self.navigationController.navigationBar setTransform:CGAffineTransformMakeTranslation(0, 0)];
    }];
    [self.mainView.button1 setUserInteractionEnabled:YES];
    [self.mainView.button3 setUserInteractionEnabled:YES];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    // 过滤掉UIButton，也可以是其他类型
//    if ( [touch.view isKindOfClass:[UIButton class]])
//    {
//        return YES;
//    }
//    
//    return NO;
//}

- (void)huhu:(id)sender
{
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"AnwStory"];
    [self.navigationController pushViewController:menuVC animated:YES];
}

- (void)knowledge:(id)sender
{
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"KnowStory"];
    [self.navigationController pushViewController:menuVC animated:YES];
}

- (void)lucky:(id)sender
{
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"LuckyStory"];
    [self.navigationController pushViewController:menuVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

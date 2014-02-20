//
//  ViewController.m
//  million
//
//  Created by 陈浩 on 14-2-3.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* fontName = @"Avenir-Book";
    UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    //self.view.backgroundColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    
    self.userField.backgroundColor = [UIColor whiteColor];
    //self.userField.layer.cornerRadius = 3.0f;
    self.userField.font = [UIFont fontWithName:fontName size:16.0f];
    self.userField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 10)];
    self.userField.leftView = leftView1;
    self.userField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.userField.layer.borderWidth = 1.0f;
    
    self.pwdField.backgroundColor = [UIColor whiteColor];
    //self.pwdField.layer.cornerRadius = 3.0f;
    self.pwdField.font = [UIFont fontWithName:fontName size:16.0f];
    self.pwdField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 10)];
    self.pwdField.leftView = leftView2;
    self.pwdField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.pwdField.layer.borderWidth = 1.0f;
    
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 41)];
    userLabel.text = @"帐号";
    userLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    userLabel.userInteractionEnabled = NO;
    [self.userField addSubview:userLabel];
    
    UILabel *pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 41)];
    pwdLabel.text = @"密码";
    pwdLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    pwdLabel.userInteractionEnabled = NO;
    [self.pwdField addSubview:pwdLabel];
    
    self.loginButton.backgroundColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    self.loginButton.layer.cornerRadius = 3.0f;
    self.loginButton.layer.masksToBounds = YES;
    //[self.loginButton setAdjustsImageWhenHighlighted:NO];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    [self.loginButton setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:51/255.0 green:119/255.0 blue:172/255.0 alpha:1]] forState:UIControlStateHighlighted];
    
    self.forgotButton.backgroundColor = [UIColor clearColor];
    self.forgotButton.titleLabel.font = [UIFont fontWithName:fontName size:12.0f];
    [self.forgotButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:mainColor forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    self.lookButton.backgroundColor = [UIColor clearColor];
    self.lookButton.titleLabel.font = [UIFont fontWithName:fontName size:12.0f];
    [self.lookButton setTitle:@"随便看看" forState:UIControlStateNormal];
    [self.lookButton setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateNormal];
    [self.lookButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
}

- (IBAction)backgroundTap:(id)sender
{
    [self.userField resignFirstResponder];
    [self.pwdField resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [self.pwdField becomeFirstResponder];
}

- (IBAction)pwdFieldDoneEditing:(id)sender
{
    [self loginButtonDone:sender];
}

- (IBAction)loginButtonDone:(id)sender
{
    NSString *loginUrl = @"http://192.168.117.1:8080/Service";
    NSString *userFieldText = self.userField.text;
    NSString *pwdFieldText = self.pwdField.text;
    //trim()!!!!!!!!!!
    NSDictionary *dict = @{};
    
    if ([userFieldText isEqualToString:@""] || userFieldText.length == 0 ||
        [pwdFieldText isEqualToString:@""] || pwdFieldText.length == 0) {
        
        [SVProgressHUD showErrorWithStatus:@"帐号或密码不能为空"];
        
    } else {
        
        dict = @{@"account": userFieldText};
        
        [SVProgressHUD showWithStatus:@"请稍后..."];
        self.loginButton.enabled = NO;
        self.userField.userInteractionEnabled = NO;
        self.pwdField.userInteractionEnabled = NO;
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:loginUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if ([responseObject isEqualToString:@"true"]) {
                [SVProgressHUD dismiss];
                
            } else {
                [SVProgressHUD dismiss];
                self.loginButton.enabled = YES;
                self.userField.userInteractionEnabled = YES;
                self.pwdField.userInteractionEnabled = YES;
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [SVProgressHUD showErrorWithStatus:@"连接超时"];
            self.loginButton.enabled = YES;
            self.userField.userInteractionEnabled = YES;
            self.pwdField.userInteractionEnabled = YES;
        }];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Notification Methods Sample

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidDisappearNotification
                                               object:nil];
}

- (void)handleNotification:(NSNotification *)notif
{
    NSLog(@"Notification recieved: %@", notif.name);
    NSLog(@"Status user info key: %@", [notif.userInfo objectForKey:SVProgressHUDStatusUserInfoKey]);
}

- (UIImage *) buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end

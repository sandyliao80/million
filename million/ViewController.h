//
//  ViewController.h
//  million
//
//  Created by 陈浩 on 14-2-3.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *userField;

@property (nonatomic,weak) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *forgotButton;

@property (weak, nonatomic) IBOutlet UIButton *lookButton;

- (IBAction)backgroundTap:(id)sender;

- (IBAction)textFieldDoneEditing:(id)sender;

- (IBAction)pwdFieldDoneEditing:(id)sender;

- (IBAction)loginButtonDone:(id)sender;

@end

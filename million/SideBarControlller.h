//
//  SideBarControlller.h
//  million
//
//  Created by 陈浩 on 14-2-16.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarControlller : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *profileLocationLabel;

@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

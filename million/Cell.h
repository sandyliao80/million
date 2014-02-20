//
//  Cell.h
//  million
//
//  Created by 陈浩 on 14-2-14.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@property (weak, nonatomic) IBOutlet UILabel *diffcultLabel;

@property (weak, nonatomic) IBOutlet UIImageView *diffcultImageView;

@end

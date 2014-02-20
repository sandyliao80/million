//
//  SideCell.h
//  million
//
//  Created by 陈浩 on 14-2-16.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UIView *topSeparator;

@property (weak, nonatomic) IBOutlet UIView *bottomSeparator;

@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

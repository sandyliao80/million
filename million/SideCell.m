//
//  SideCell.m
//  million
//
//  Created by 陈浩 on 14-2-16.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "SideCell.h"

@implementation SideCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)awakeFromNib{
    
    self.bgView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    
    self.topSeparator.backgroundColor = [UIColor colorWithWhite:0.1f alpha:1.0f];
    self.bottomSeparator.backgroundColor = [UIColor colorWithWhite:0.3f alpha:1.0f];
    
    NSString* boldFontName = @"Avenir-Black";
    
    self.titleLabel.textColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    self.titleLabel.font = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.countLabel.textColor = [UIColor whiteColor];
    self.countLabel.backgroundColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    self.countLabel.font = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.countLabel.layer.cornerRadius = 3.0f;
}

@end

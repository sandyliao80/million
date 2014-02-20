//
//  Cell.m
//  million
//
//  Created by 陈浩 on 14-2-14.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "Cell.h"

@implementation Cell

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

-(void)awakeFromNib
{
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    UIColor* neutralColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    
    UIColor* mainColorLight = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:0.4f];
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldItalicFontName = @"Avenir-BlackOblique";
    NSString* boldFontName = @"Avenir-Black";
    
    self.nameLabel.textColor =  mainColor;
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.dataLabel.textColor =  neutralColor;
    self.dataLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.diffcultLabel.textColor = mainColorLight;
    self.diffcultLabel.font =  [UIFont fontWithName:boldItalicFontName size:10.0f];
    
//    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.picImageView.clipsToBounds = YES;
//    self.picImageView.layer.cornerRadius = 2.0f;
//    
//    self.picImageContainer.backgroundColor = [UIColor whiteColor];
//    self.picImageContainer.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:0.6f].CGColor;
//    self.picImageContainer.layer.borderWidth = 1.0f;
//    self.picImageContainer.layer.cornerRadius = 2.0f;    
    
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 20.0f;
    self.profileImageView.layer.borderWidth = 2.0f;
    self.profileImageView.layer.borderColor = mainColorLight.CGColor;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end

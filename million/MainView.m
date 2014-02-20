//
//  MainView.m
//  million
//
//  Created by 陈浩 on 14-2-18.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        CGRect screen = [[UIScreen mainScreen] bounds];
        _centerX = screen.size.width / 2;
        _centerY = screen.size.height / 2;
        
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button1.frame = CGRectMake(30, 75, 90, 90);
        [self.button1 setBackgroundImage:[UIImage imageNamed:@"anwBtn.png"] forState:UIControlStateNormal];
        [self addSubview:self.button1];
        
        self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button2.frame = CGRectMake(160, 75, 90, 90);
        [self.button2 setBackgroundImage:[UIImage imageNamed:@"knowBtn.png"] forState:UIControlStateNormal];
        [self addSubview:self.button2];
        
        self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button3.frame = CGRectMake(30, 175, 90, 90);
        [self.button3 setBackgroundImage:[UIImage imageNamed:@"luckyBtn.png"] forState:UIControlStateNormal];
        [self addSubview:self.button3];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)buttonDone:(id)sender
{
    
}

-(void)gogo:(id)sender
{
    
}

@end

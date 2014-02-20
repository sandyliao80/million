//
//  SideBarControlller.m
//  million
//
//  Created by 陈浩 on 14-2-16.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "SideBarControlller.h"
#import "SideCell.h"

@interface SideBarControlller ()

@property (nonatomic, strong) NSArray* items;

@end

@implementation SideBarControlller

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
	[super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSString* boldFontName = @"Avenir-Black";
    NSString* fontName = @"Avenir-BlackOblique";
    
    self.profileNameLabel.textColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    self.profileNameLabel.font = [UIFont fontWithName:boldFontName size:14.0f];
    self.profileNameLabel.text = @"Moon";
    
    self.profileLocationLabel.textColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    self.profileLocationLabel.font = [UIFont fontWithName:fontName size:12.0f];
    self.profileLocationLabel.text = @"身价：百万富翁";
    
    self.profileImageView.image = [UIImage imageNamed:@"github-logo.png"];
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    self.profileImageView.layer.cornerRadius = 35.0f;
    
    
    NSDictionary* object1 = [NSDictionary dictionaryWithObjects:@[ @"主页", @"0", @"envelope" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"Updates", @"0", @"check" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"我的帐号", @"7", @"account" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object3 = [NSDictionary dictionaryWithObjects:@[ @"设置", @"0", @"settings" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object4 = [NSDictionary dictionaryWithObjects:@[ @"退出帐户", @"0", @"arrow" ] forKeys:@[ @"title", @"count", @"icon" ]];
    
    self.items = @[object1, object2, object3, object4];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SideCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SideCell"];
    
    NSDictionary* item = self.items[indexPath.row];
    
    cell.titleLabel.text = item[@"title"];
    cell.iconImageView.image = [UIImage imageNamed:item[@"icon"]];
    
    NSString* count = item[@"count"];
    if(![count isEqualToString:@"0"]){
        cell.countLabel.text = count;
    }
    else{
        cell.countLabel.alpha = 0;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

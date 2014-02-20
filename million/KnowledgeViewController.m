//
//  KnowledgeViewController.m
//  million
//
//  Created by 陈浩 on 14-2-14.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "Cell.h"
#import "Knowledge.h"

@interface KnowledgeViewController ()

//@property (nonatomic, strong) NSArray* profileImages;

@end

@implementation KnowledgeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
        case 4: return [UIImage imageNamed:@"4StarsSmall"];
        case 5: return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.9 alpha:0.6];
    
//    self.profileImages = [NSArray arrayWithObjects:@"profile.jpg", @"profile-1.jpg", @"profile-2.jpg", @"profile-3.jpg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Knowledge *knowledge = [[Knowledge alloc] initKnowledge];
    NSMutableArray *knowAry = knowledge.knowledgeAry;
    return knowAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Knowledge *knowledge = [[Knowledge alloc] initKnowledge];
    NSMutableArray *knowAry = knowledge.knowledgeAry;
    NSArray *everyAry = knowAry[indexPath.row%knowAry.count];
    
    static NSString *CellIdentifier = @"knowledge";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.nameLabel.text = everyAry[0];
    cell.dataLabel.text = everyAry[1];
    
    cell.diffcultLabel.text = @"难度系数";
    cell.diffcultImageView.image = [self imageForRating:[everyAry[2] intValue]];
    
    //NSString* profileImageName = self.profileImages[indexPath.row%self.profileImages.count];
    //cell.profileImageView.image = [UIImage imageNamed:profileImageName];
    cell.profileImageView.image = [UIImage imageNamed:@"100.jpg"];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

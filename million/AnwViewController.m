//
//  AnwViewController.m
//  million
//
//  Created by 陈浩 on 14-2-7.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "AnwViewController.h"
#import "CheckAid.h"
#import "Question.h"

@interface AnwViewController ()

@property (nonatomic, strong) NSMutableDictionary *dict;//key对应每道选择题 value是4个选框的图片数组

@property (nonatomic, strong) NSMutableDictionary *answerDict;//答案与题号的value key

@property (nonatomic, strong) NSMutableArray *optionBtn;//答题情况的题号数组

@end

@implementation AnwViewController
{
    int page;
}

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
    
    BOOL checked = NO;
    _dict = [NSMutableDictionary dictionaryWithCapacity:10];
    _answerDict = [NSMutableDictionary dictionaryWithCapacity:10];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 504)];
    Question *question = [[Question alloc] initQuestion];
    self.optionBtn = [[NSMutableArray alloc] init];
    //遍历所有的题目与选项
    for (int i = 0; i<question.allQuestion.count; i++) {
        
        NSMutableArray *questionAry = question.allQuestion[i];
        UIView *wholeView = [[UIView alloc] initWithFrame:CGRectMake(0+320*i, 20, 320, 500)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 50, 15)];
        label.font =[UIFont fontWithName:@"Optima-ExtraBlack" size:15];
        label.textColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
        label.text = questionAry[3];
        [wholeView addSubview:label];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
        textView.text = questionAry[0];
        textView.editable = NO;
        textView.font = [UIFont fontWithName:@"Arial" size:15];
        [wholeView addSubview:textView];
        
        NSMutableArray *imgAry = [[NSMutableArray alloc] init];
        NSArray *option = questionAry[1];
        for (int n =0; n<option.count; n++) {
            
            UIView *viewBtn = [[UIView alloc] initWithFrame:CGRectMake(20, 260+30*n, 280, 30)];
            viewBtn.tag = n;
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
            imageView.image = [self checkBoxImage:checked];
            [imgAry addObject:imageView];
            [viewBtn addSubview:imageView];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 5, 200, 20)];
            label.numberOfLines = 1;
            label.text = option[n];
            label.font = [UIFont fontWithName:@"Arial" size:15];
            [viewBtn addSubview:label];
            
            UITapGestureRecognizer *tapBtn = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBtn:)];
            [viewBtn addGestureRecognizer:tapBtn];
            
            [wholeView addSubview:viewBtn];
        }
        
        CheckAid *aid = [[CheckAid alloc] initwithBool];
        [imgAry addObject:aid];
        [_dict setObject:imgAry forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        
        [self.scrollView addSubview:wholeView];
    }
    //最后的答题页面
    UIView *lastView = [[UIView alloc] initWithFrame:CGRectMake(0+320*question.allQuestion.count, 20, 320, 500)];
    UILabel *datika = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
    datika.text = @"答题情况";
    datika.font = [UIFont fontWithName:@"Arial" size:17];
    [lastView addSubview:datika];
    
    int isN = 0;int circle = 0;
    for (int i = 0; i<question.allQuestion.count; i++) {
        if (i%7 == 0) {
            isN++;
            circle = 0;
        }
        UIButton *anwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [anwBtn setTag:i];
        anwBtn.frame = CGRectMake(20+42*circle++, 10+40*isN, 25, 25);
        anwBtn.backgroundColor = [UIColor whiteColor];
        anwBtn.layer.borderWidth = 1;
        anwBtn.layer.cornerRadius = 4.0;
        anwBtn.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
        [anwBtn setTitle:[self intToString:i+1] forState:UIControlStateNormal];
        [anwBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [anwBtn setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1] withButton:anwBtn] forState:UIControlStateHighlighted];
        [anwBtn addTarget:self action:@selector(anwTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.optionBtn addObject:anwBtn];
        [lastView addSubview:anwBtn];
    }
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(40, 400, 240, 40);
    submitBtn.backgroundColor = [UIColor colorWithRed:240/255.0 green:173/255.0 blue:78/255.0 alpha:1];
    submitBtn.layer.cornerRadius = 3.0f;
    submitBtn.layer.masksToBounds = YES;
    [submitBtn setAdjustsImageWhenHighlighted:NO];
    [submitBtn setTitle:@"提交并查看答案" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:237/255.0 green:155/255.0 blue:67/255.0 alpha:1] withButton:submitBtn] forState:UIControlStateHighlighted];
    [submitBtn addTarget:self action:@selector(buttonDone:) forControlEvents:UIControlEventTouchUpInside];
    [lastView addSubview:submitBtn];
    
    [self.scrollView addSubview:lastView];
    
    self.scrollView.autoresizingMask = 0xFF;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentMode = UIViewContentModeCenter;
    self.scrollView.contentSize = CGSizeMake((question.allQuestion.count + 1) * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onClickBtn:(UIGestureRecognizer *) gesture
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    page = floor((self.scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    
    NSInteger index = [(UIGestureRecognizer *)gesture view].tag;
    NSArray *pageAry = [_dict objectForKey:[self intToString:page]];
    NSArray *keyAry = [_dict allKeys];
    
    for (int i = 0; i<keyAry.count; i++) {
        if (page == i) {
            CheckAid *aid = [pageAry objectAtIndex:pageAry.count -1];
            if (aid.isChecked) {
                //已点击
                if (aid.checkInt == index) {
                    //点击同一checkbox 取消标记
                    aid.isChecked = !aid.isChecked;
                    UIImageView *imgView = [pageAry objectAtIndex:index];
                    imgView.image = [self checkBoxImage:aid.isChecked];
                    [self.answerDict removeObjectForKey:[self intToString:page]];
                    [self unCheckedAnswer:page];
                } else {
                    //点击不同checkbox取消之前的标记再标记新点击的checkbox
                    UIImageView *preImgView = [pageAry objectAtIndex:aid.checkInt];
                    preImgView.image = [self checkBoxImage:!aid.isChecked];
                    UIImageView *imgView = [pageAry objectAtIndex:index];
                    imgView.image = [self checkBoxImage:aid.isChecked];
                    aid.checkInt = index;
                    [self.answerDict setObject:[self intToString:index] forKey:[self intToString:page]];
                    [self checkedAnswer:page];
                    CGPoint point = CGPointMake(self.scrollView.frame.size.width+page*self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
                    [self.scrollView setContentOffset:point animated:YES];
                }
                
            } else {
                //未点击
                aid.isChecked = !aid.isChecked;
                UIImageView *imgView = [pageAry objectAtIndex:index];
                imgView.image = [self checkBoxImage:aid.isChecked];
                aid.checkInt = index;
                [self.answerDict setObject:[self intToString:index] forKey:[self intToString:page]];
                [self checkedAnswer:page];
                CGPoint point = CGPointMake(self.scrollView.contentOffset.x + CGRectGetWidth(self.scrollView.frame), self.scrollView.contentOffset.y);
                [self.scrollView setContentOffset:point animated:YES];
            }
            
        }
    }
}

- (void) buttonDone:(id)sender
{
//    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    NavViewController *controller = (NavViewController *)[stroyboard instantiateViewControllerWithIdentifier:@"NavViewController"];;
//    [self presentViewController:controller animated:YES completion:nil];
    Question *questions = [[Question alloc] initQuestion];
    NSMutableArray *allQuestions = questions.allQuestion;
    int totalMoney = 0;
    if ([self.answerDict count] != allQuestions.count) {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"当前有题目未完成，确定提交？" delegate:self cancelButtonTitle:@"不，待会提交!" destructiveButtonTitle:@"是，我要提交。" otherButtonTitles: nil];
        [actionSheet showInView:self.view];
    }else {
        
        for (int i =0; i<allQuestions.count; i++) {
            NSArray *questionAry = allQuestions[i];
            NSString *correctAnw = questionAry[2];
            NSString *checkedAnw = [self.answerDict objectForKey:[self intToString:i]];
            if ([checkedAnw isEqualToString:correctAnw]) {
                [self correctAnswer:i];
                NSString *money = [questionAry[3] substringFromIndex:1];
                totalMoney += [money intValue];
            }else {
                [self worronAnswer:i];
                [self updateWorronAnswer:i withCorrectAnw:correctAnw];
            }
        }
        
        NSString *msg = [NSString stringWithFormat:@"恭喜您获得：$%@",[self intToString:totalMoney]];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答题结束" message:msg delegate:self cancelButtonTitle:@":]" otherButtonTitles: nil];
        [alert show];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    Question *questions = [[Question alloc] initQuestion];
    NSMutableArray *allQuestions = questions.allQuestion;
    int totalMoney = 0;
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        
        for (int i =0; i<allQuestions.count; i++) {
            NSArray *questionAry = allQuestions[i];
            NSString *correctAnw = questionAry[2];
            NSString *checkedAnw = [self.answerDict objectForKey:[self intToString:i]];
            if ([checkedAnw isEqualToString:correctAnw]) {
                [self correctAnswer:i];
                NSString *money = [questionAry[3] substringFromIndex:1];
                totalMoney += [money intValue];
            }else {
                [self worronAnswer:i];
                [self updateWorronAnswer:i withCorrectAnw:correctAnw];
            }
        }
        
        NSString *msg = [NSString stringWithFormat:@"恭喜您获得:%@",[self intToString:totalMoney]];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答题结束" message:msg delegate:self cancelButtonTitle:@":]" otherButtonTitles: nil];
        [alert show];
    }
}

- (void) anwTap:(id)sender
{
    NSInteger index = [sender tag];
    CGPoint point = CGPointMake(index * CGRectGetWidth(self.scrollView.frame), self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:point animated:YES];
}

- (UIImage *) checkBoxImage:(BOOL)isChecked
{
    NSString *suffix = isChecked ? @"on" : @"off";
    NSString *imageName = [NSString stringWithFormat:@"%@%@", @"cb_glossy_", suffix];
    return [UIImage imageNamed:imageName];
}

- (NSString *) intToString:(NSInteger) num
{
    return [NSString stringWithFormat:@"%ld",(long)num];
}

- (void) checkedAnswer:(int) questionIndex
{
    UIButton *btn = (UIButton *)self.optionBtn[questionIndex];
    [btn setBackgroundColor:[UIColor colorWithRed:66/255.0 green:139/255.0 blue:202/255.0 alpha:1]];
}

- (void) unCheckedAnswer:(int) questionIndex
{
    UIButton *btn = (UIButton *)self.optionBtn[questionIndex];
    [btn setBackgroundColor:[UIColor whiteColor]];
}

- (void) correctAnswer:(int) questionIndex
{
    UIButton *btn = (UIButton *)self.optionBtn[questionIndex];
    [btn setBackgroundColor:[UIColor colorWithRed:92/255.0 green:184/255.0 blue:92/255.0 alpha:1]];
}

- (void) worronAnswer:(int) questionIndex
{
    UIButton *btn = (UIButton *)self.optionBtn[questionIndex];
    [btn setBackgroundColor:[UIColor colorWithRed:217/255.0 green:83/255.0 blue:79/255.0 alpha:1]];
}

- (void) updateWorronAnswer:(int) questionIndex withCorrectAnw:(NSString *)correctAnw
{
    NSArray *pageAry = [_dict objectForKey:[self intToString:questionIndex]];
    UIImageView *imgView = [pageAry objectAtIndex:[correctAnw intValue]];
    imgView.image = [UIImage imageNamed:@"cb_green_on.png"];
}

- (UIImage *) buttonImageFromColor:(UIColor *)color withButton:(UIButton *)button{
    CGRect rect = CGRectMake(0, 0, button.frame.size.width, button.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end

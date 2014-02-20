//
//  Question.m
//  million
//
//  Created by 陈浩 on 14-2-11.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id) initQuestion
{
    NSArray *question1 = [[NSArray alloc] init];
    question1 = @[@"1.下列哪一种不是水的三态?",@[@"A.固态",@"B.水态",@"C.液态",@"D.气态"],@"1",@"$1000"];
    
    NSArray *question2 = [[NSArray alloc] init];
    question2 = @[@"2.“爆竹声中一岁除，春风送暖入屠苏”，这里的“屠苏”指的是?",@[@"A.苏州",@"B.房屋",@"C.酒",@"D.庄稼"],@"2",@"$1000"];
    
    NSArray *question3 = [[NSArray alloc] init];
    question3 = @[@"3.《三十六计》是体现我国古代卓越军事思想的一部兵书，下列不属于《三十六计》的是?",@[@"A.浑水摸鱼",@"B.反戈一击",@"C.笑里藏刀",@"D.反客为主"],@"1",@"$2000"];
    
    NSArray *question4 = [[NSArray alloc] init];
    question4 = @[@"4.1932年，清华大学招生试题中有一道对对子题，上联“孙行者”，下面下联中最合适的是?",@[@"A.胡适之",@"B.周作人",@"C.郁达夫",@"D.唐三藏"],@"0",@"$3000"];
    
    NSArray *question5 = [[NSArray alloc] init];
    question5 = @[@"5.《百家姓》中没有下面哪个姓?",@[@"A.乌",@"B.巫",@"C.肖",@"D.萧"],@"2",@"$3000"];
    
    NSArray *question6 = [[NSArray alloc] init];
    question6 = @[@"6.假如你的一首五言绝诗被杂志社采用，按照正文部分每字5元来计算，你应得多少稿费？",@[@"A.50元",@"B.100元",@"C.150元",@"D.200元"],@"1",@"$1000"];
    
    NSArray *question7 = [[NSArray alloc] init];
    question7 = @[@"7.度量衡是我国古代使用的计量单位，其中“衡”是指哪个方面的标准？",@[@"A.长度",@"B.面积",@"C.体积",@"D.重量"],@"3",@"$3000"];
    
    NSArray *question8 = [[NSArray alloc] init];
    question8 = @[@"8.元太祖铁木真是蒙古草原上的英雄，他被人们尊称为“成吉思汗”，“汗”的意思是大王，那么“成吉思”的意思是?",@[@"A.天空",@"B.大海",@"C.草原",@"D.高山"],@"1",@"$2000"];
    
    NSArray *question9 = [[NSArray alloc] init];
    question9 = @[@"9.一部著作的完成需要很长的时间，请问下列哪部著作的成书时间最长?",@[@"A.《徐霞客游记》",@"B.《说文解字》",@"C.《天工开物》",@"D.《梦溪笔谈》"],@"0",@"$3000"];
    
    NSArray *question10 = [[NSArray alloc] init];
    question10 = @[@"10.北京有着三千余年的悠久历史和八百多年的建都史，它在不同朝代也有着不同的称谓，下面哪个不是北京的别称?",@[@"A.大都",@"B.中都",@"C.上都",@"D.南京"],@"2",@"$2000"];
    
    NSArray *question11 = [[NSArray alloc] init];
    question11 = @[@"11.下列哪项不是端午节的习俗?",@[@"A.挂香包",@"B.插艾蒿",@"C.登高采菊",@"D.喝雄黄酒"],@"2",@"$1000"];
    
    NSArray *question12 = [[NSArray alloc] init];
    question12 = @[@"12.王先生的QQ签名档最近改成了“庆祝弄璋之喜”，王先生近来的喜事是?",@[@"A.新婚",@"B.搬家",@"C.考试通过",@"D.妻子生了个男孩"],@"3",@"$1000"];
    
    NSArray *question13 = [[NSArray alloc] init];
    question13 = @[@"13.孟子说：“君子有三乐”，下列哪项不在其“三乐”之列？",@[@"A.乡里无不称其善也",@"B.父母俱存，兄弟无故",@"C.仰不愧于天，俯不怍于人 ",@"D.得天下英才而教育之"],@"0",@"$1000"];
    
    NSArray *question14 = [[NSArray alloc] init];
    question14 = @[@"14.下列哪个成语典故说的是吕不韦的故事?",@[@"A.一饭千金",@"B.一字千金",@"C.一诺千金",@"D.一掷千金"],@"1",@"$1000"];
    
    NSArray *question15 = [[NSArray alloc] init];
    question15 = @[@"15.天干地支纪年始于汉代，请问这种纪年是以哪一天为起点的?",@[@"A.除夕",@"B.正月初一",@"C.立春",@"D.春分"],@"2",@"$1000"];
    
    self.allQuestion = [NSMutableArray arrayWithObjects:question1,question2,question3,question4,question5,question6,question7,question8,question9,question10,question11,question12,question13,question14,question15, nil];

    return self;
};

@end

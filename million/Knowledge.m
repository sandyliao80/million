//
//  Knowledge.m
//  million
//
//  Created by 陈浩 on 14-2-15.
//  Copyright (c) 2014年 陈浩. All rights reserved.
//

#import "Knowledge.h"

@implementation Knowledge

- (id)initKnowledge
{
    NSArray *knowledge1 = [[NSArray alloc] init];
    knowledge1 = @[@"生活常识",@"冰糖是用[白砂糖]做的。",@"1"];
    
    NSArray *knowledge2 = [[NSArray alloc] init];
    knowledge2 = @[@"音乐知识",@"被称为“交响乐团的心脏”的是：[弦乐器]。",@"3"];
    
    NSArray *knowledge3 = [[NSArray alloc] init];
    knowledge3 = @[@"寰宇地理",@"北美洲与南美洲是以[巴拿马运河]为分界。",@"2"];
    
    NSArray *knowledge4 = [[NSArray alloc] init];
    knowledge4 = @[@"趣味百科",@"八小时工作制度最早是在[英国]出现。",@"4"];
    
    NSArray *knowledge5 = [[NSArray alloc] init];
    knowledge5 = @[@"寰宇地理",@"被称为风车之国的国家是[荷兰]。",@"3"];
    
    NSArray *knowledge6 = [[NSArray alloc] init];
    knowledge6 = @[@"趣味百科",@"鞭炮和爆竹相比[爆竹]历史更悠久。",@"4"];
    
    NSArray *knowledge7 = [[NSArray alloc] init];
    knowledge7 = @[@"历史文明",@"巴黎有两个真正的王宫，一个是卢浮宫，另一个是凡尔赛宫。凡尔赛宫是[路易十四]国王在位期间建造的。",@"5"];
    
    NSArray *knowledge8 = [[NSArray alloc] init];
    knowledge8 = @[@"物理知识",@"地球上出现的潮汐是由于：[地月吸引力]。",@"2"];
    
    NSArray *knowledge9 = [[NSArray alloc] init];
    knowledge9 = @[@"生活常识",@"把两个玻璃杯倒满水，过了一会儿，第一个杯子壁上有很多小气泡，第二个没有，那么，这两杯水中，[第一杯]是生水。",@"5"];
    
    NSArray *knowledge10 = [[NSArray alloc] init];
    knowledge10 = @[@"生物知识",@"成人共有骨[206]块。",@"3"];
    
    NSArray *knowledge11 = [[NSArray alloc] init];
    knowledge11 = @[@"国学知识",@" “草堂留后世，诗圣著千秋”指的是[杜甫]。",@"3"];
    
    NSArray *knowledge12 = [[NSArray alloc] init];
    knowledge12 = @[@"寰宇地理",@"被称为智慧之都的一座古代名城是[亚历山大]。",@"4"];
    
    NSArray *knowledge13 = [[NSArray alloc] init];
    knowledge13 = @[@"电影知识",@"电影《魂断蓝桥》是以[伦敦]为背景。",@"2"];
    
    NSArray *knowledge14 = [[NSArray alloc] init];
    knowledge14 = @[@"医学百科",@"百会穴在：[头顶正中]。",@"1"];
    
    NSArray *knowledge15 = [[NSArray alloc] init];
    knowledge15 = @[@"生物知识",@"吃芒果时吃的是它的[果皮]。",@"2"];
    
    NSArray *knowledge16 = [[NSArray alloc] init];
    knowledge16 = @[@"寰宇地理",@"大连是中国北方著名的港口、工业、贸易、旅游城市，是东北亚商贸、金融、资讯、旅游的中心，素有北方[香港]的美誉。",@"4"];
    
    NSArray *knowledge17 = [[NSArray alloc] init];
    knowledge17 = @[@"音乐知识",@"“大珠小珠落玉盘”所形容的是[琵琶]的弹奏声",@"1"];
    
    NSArray *knowledge18 = [[NSArray alloc] init];
    knowledge18 = @[@"生物知识",@"口的形状反映了鱼的摄食习惯,喜欢吃水面食物的鱼的口形应该：[向上翘]。",@"5"];
    
    NSArray *knowledge19 = [[NSArray alloc] init];
    knowledge19 = @[@"生活常识",@"茶叶的含水量高于8%会导致[霉变]",@"3"];
    
    NSArray *knowledge20 = [[NSArray alloc] init];
    knowledge20 = @[@"化学知识",@"萃取是利用各种物[对溶剂的溶解度不同]的特性来分离混合物",@"2"];
    
    self.knowledgeAry = [NSMutableArray arrayWithObjects:knowledge1,knowledge2,knowledge3,knowledge4,knowledge5,knowledge6,knowledge7,knowledge8,knowledge9,knowledge10,knowledge11,knowledge12,knowledge13,knowledge14,knowledge15,knowledge16,knowledge17,knowledge18,knowledge19,knowledge20,nil];
    
    return self;
}

@end

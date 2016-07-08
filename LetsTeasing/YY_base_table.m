//
//  YY_base_table.m
//  LetsTeasing
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "YY_base_table.h"
#import "textCell.h"
#import "JCAlertView.h"


@implementation YY_base_table


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    self.delegate =self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return self;
}

//tableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellContent.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CMainCell = @"textCell";
    textCell * cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    
    if(cell == nil)
    {
        cell = [[textCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CMainCell];
    }
    if(cell.TextLabel.text != nil)
    {
//        NSLog(@"好尴尬，cell的值不等于0 ，我要把它变成0");
        cell.TextLabel.text = @"";
    }
    //创建完字体格式之后就告诉cell
    cell.TextLabel.text = _cellContent[indexPath.row];
//    NSNumber * num = [NSNumber numberWithInteger:indexPath.row];
//    [self getData:num conString:@"saidWord"];
    cell.TextLabel.numberOfLines = 0;
    CGFloat  height = [self heightForString:cell.TextLabel andWidth:YY_ININPONE5_WITH(300.0f)];
    [cell.TextLabel setFrame:CGRectMake(YY_ININPONE5_WITH(10.0f), YY_ININPONE5_HEIGHT(18.0f) , YY_ININPONE5_WITH(300.0f), height)];
    //设置cell不能被选中
    cell.tag = 10010;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Arial是字体的名字，他妈的不是给字体命名啊 我日
    UIFont * font = [UIFont fontWithName:@"Arial" size:13.0];
    UILabel * label = [[UILabel alloc]init];
    [label setFont:font];
    label.text =_cellContent[indexPath.row];
    label.numberOfLines = 0;
    label.autoresizingMask =YES;
    CGFloat  height = [self heightForString:label andWidth:YY_ININPONE5_WITH(300.0f)];
    _heightTable = YY_ININPONE5_HEIGHT(height)+YY_ININPONE5_HEIGHT(18.0f);
    return YY_ININPONE5_HEIGHT(height)+YY_ININPONE5_HEIGHT(18.0f);

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (void)showAlertWithOneButton{
    NSArray * aaa = [NSArray arrayWithObjects:@"今天是个好日子",@"明天是个好日子明天是个好日子明天是个好日子明天是个好日子明天是个好日子",@"后天也是个好日子",@"大后天不是个好日子",@"好日子好日子",@"1",@"2",@"3",@"4", nil];
      [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa];

}

//计算行高
- (NSInteger) heightForString:(UILabel *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    NSInteger height = sizeToFit.height;
    return height;
    
}

////他妈的这里出现了一个崩溃，EXC_BAd_ACCESS，也许是爸爸我比较机智，或者命中注定吧，在奔溃次数不多的情况下，我还是一眼就猜到了assign会自动释放，所以字典变成野指针了，好险
//-(void)getObjectFromBomob
//{NSLog(@"3");
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"GameScore"];
//    //查找GameScore表的数据
//    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
//        for (BmobObject *obj in array) {
//            //打印playerName
////            NSLog(@"obj.playerName = %@", [obj objectForKey:@"playerName"]);
//            //打印objectId,createdAt,updatedAt
//            NSNumber * num =  [obj objectForKey:@"numberOfSaidWords"];
//            NSString * str = [obj objectForKey:@"saidWord"];
//            [self addObjectForDic:num value:str];
//        }
//    }];
//}
//-(void)addObjectForDic:(NSNumber *)numb value:(NSString*) Value
//{NSLog(@"4");
//    NSString * str = [NSString stringWithFormat:@"%@",numb];
//    [_SaidWord setObject:Value forKey:str];
//
//}
@end

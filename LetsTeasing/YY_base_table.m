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
#import "dict.h"


@implementation YY_base_table


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
//    [self reloadData];
  
    [self initDict];
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
//    return _cellContent.count;
    return  _dict.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CMainCell = @"textCell";
   textCell *  cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    
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
//    dict * data = [[dict alloc]init];
//    NSMutableDictionary * dict = [data neirong];
    NSString * str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
       NSMutableDictionary * dict1 = [_dict objectForKey:str];
    cell.TextLabel.text = [dict1 objectForKey:@"saidWord"];
    cell.namelabel.text = [dict1 objectForKey:@"playerName"];
//    cell.TextLabel.text = _cellContent[indexPath.row];
    cell.TextLabel.numberOfLines = 0;
    CGFloat  height = [self heightForString:cell.TextLabel andWidth:YY_ININPONE5_WITH(300.0f)];
    [cell.TextLabel setFrame:CGRectMake(YY_ININPONE5_WITH(10.0f), YY_ININPONE5_HEIGHT(18.0f) , YY_ININPONE5_WITH(300.0f), height+YY_ININPONE5_HEIGHT(1.0f))];
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
    NSString * str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    NSMutableDictionary * dict1 = [_dict objectForKey:str];
    label.text = [dict1 objectForKey:@"saidWord"];
//    label.text =_cellContent[indexPath.row];
    label.numberOfLines = 0;
    label.autoresizingMask =YES;
    CGFloat  height = [self heightForString:label andWidth:YY_ININPONE5_WITH(300.0f)];
    _heightTable = YY_ININPONE5_HEIGHT(height)+YY_ININPONE5_HEIGHT(18.0f);
    return YY_ININPONE5_HEIGHT(height)+YY_ININPONE5_HEIGHT(20.0f);

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
//- (void)showAlertWithOneButton{
//
//      [JCAlertView showOneButtonWithTitle:@"XXX评论"];
//
//}
-(void)initDict
{
    _data = [[dict alloc]init];
    _dict = [_data neirong];
   
}
//计算行高
- (NSInteger) heightForString:(UILabel *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    NSInteger height = sizeToFit.height;
    return height;
    
}
//-(void)getObjectFromBomob
//{
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"GameScore"];
//    //查找GameScore表的数据
//    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
//        for (BmobObject *obj in array) {
//            //            NSNumber * num =  [obj objectForKey:@"numberOfSaidWords"];
//            //            NSString * str = [obj objectForKey:@"saidWord"];
//            NSString * name =[obj objectForKey:@"playerName"];
//            //            NSString * Id  = [obj objectForKey:@"objectId"];
//            //            [self addObjectForDic:num PlayerName:name Words:str ID:Id];
//            
//        }
//    }];
//    
//}
////把每一组数据传入字典中
//-(void)addObjectForDic:(NSNumber *)numb PlayerName:(NSString*) Name Words:(NSString*)SaidWord ID:(NSString*)bgdID
//{
//    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
//[dict setObject:Name forKey:@"playerName"];
//    [dict setObject:SaidWord forKey:@"saidWord"];
//    [dict setObject:bgdID forKey:@"objectId"];
//    [dict setObject:numb forKey:@"numberOfSaidWords"];
//   _info = [PersonalInfo initwithInfo:dict];
//      NSLog(@"%@",_info.Name);
//}


@end

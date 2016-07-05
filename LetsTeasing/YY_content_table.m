//
//  YY_content_table.m
//  LetsTeasing
//
//  Created by apple on 16/7/2.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "YY_content_table.h"
#import "textCell.h"
#define lengthForRow  19

@implementation YY_content_table
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    self.delegate =self;
    self.dataSource = self;
    return self;
}
-(void)setArray:(NSArray*)Array
{
    self.cellContent = Array;
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
    //创建完字体格式之后就告诉cell
    cell.TextLabel.text = _cellContent[indexPath.row];
    cell.TextLabel.numberOfLines = cell.TextLabel.text.length/lengthForRow +1;
    [cell.TextLabel setFrame:CGRectMake(0, 30 , 260, 20*(cell.TextLabel.text.length/lengthForRow+1))];
    //设置cell不能被选中
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * strcon =_cellContent[indexPath.row];
    return floor(strcon.length/23+1)*20 +30;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end

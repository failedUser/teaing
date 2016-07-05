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
#define TimeFor

@implementation YY_base_table
//给Cell添加长按手势
-(void)longGesture:(BOOL)bools
{
    if (bools) {
        UILongPressGestureRecognizer * longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongGesture:)];
        longGesture.minimumPressDuration = 0.5;
        [self addGestureRecognizer:longGesture];
    }
    else{
        NSLog(@"长按事件失败");
    }
    

}
-(void)LongGesture:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:self];
        
        NSIndexPath * indexPath = [self indexPathForRowAtPoint:point];
        
        if(indexPath == nil) NSLog(@"nimeia");
        else{
            [self willShowAlert];
            [self showAlertWithOneButton];
            
        }
        
    }
    
}
-(void)willShowAlert
{
  
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    self.delegate =self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UITapGestureRecognizer * Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesBegan)];
    [self addGestureRecognizer:Gesture];
    return self;
}
-(void)touchesBegan
{
// self.Alert.hidden = y0(<#double#>)
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
    cell.TextLabel.backgroundColor = [UIColor grayColor];
    cell.TextLabel.numberOfLines = ceilf(cell.TextLabel.text.length/23)+1;
    CGFloat  height = [self heightForString:cell.TextLabel andWidth:300];
    [cell.TextLabel setFrame:CGRectMake(10, 18 , 300, height)];
    //设置cell不能被选中
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
    label.numberOfLines = ceilf(label.text.length/23)+1;
    CGFloat  height = [self heightForString:label andWidth:300];
    _heightTable = height+18;
    return height+18;

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
//    [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"发送" Click:nil];
      [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa];

}

//计算行高
- (NSInteger) heightForString:(UILabel *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    NSInteger height = sizeToFit.height;
    return height;
    
}

-(void)didseleted
{
       [self longGesture:YES];
}



@end

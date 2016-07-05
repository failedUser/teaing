//
//  Personal_centerViewController.m
//  LetsTeasing
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "Personal_centerViewController.h"
#define heigdtforSection 10
#define HeightforCell 35

@interface Personal_centerViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * List_name1;
    NSArray * List_name2;
    NSArray * List_name3;
    NSArray * Array_section;
    
    UISwitch * Switch;
}

@end

@implementation Personal_centerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    List_name1 = [NSArray arrayWithObjects:@"昵称", nil];
    List_name2 = [NSArray arrayWithObjects:@"消息推送",@"个性化", nil];
    List_name3 = [NSArray arrayWithObjects:@"给个好评",@"帮助",@"关于", nil];
    Array_section = [NSArray arrayWithObjects:List_name1,List_name2,List_name3, nil];
    UITableView  * person_tabV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStyleGrouped];
    person_tabV.delegate = self;
    person_tabV.dataSource = self;
    person_tabV.scrollEnabled =NO; //设置tableview 不能滚动
    [self.view  addSubview:person_tabV];
    [self addLogOutButton:person_tabV];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
    }else if (section == 1)
    {
        return 2;
    }else if(section == 2){
        return 3;
    }else
    {
        return 0;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellname = @"perCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname ];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];
    }
    //创建字体一定要在值的前面，要不然已经取值之后无法修改
    UIFont *newFont = [UIFont fontWithName:@"Arial" size:13.0];
    //创建完字体格式之后就告诉cell
    cell.textLabel.font = newFont;
    //获取cell当前section的数组
    NSArray * list = Array_section[indexPath.section];
    cell.textLabel.text = list[indexPath.row];
    
    if(indexPath.section == 1)
    {
        [self addbutton:cell button:Switch];
    }else if(indexPath.section == 0||indexPath.section == 2)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.tintColor = [UIColor redColor];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return heigdtforSection*2;
    else if (section == 1)
        return heigdtforSection;
    else if (section == 2)
        return heigdtforSection;
    return  0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0)
        return heigdtforSection;
    else if (section == 1)
        return heigdtforSection;
    else if (section == 2)
        return heigdtforSection;
    return  0;
    
}
//添加switch
-(void)addbutton:(UITableViewCell *) cell1 button:(UISwitch *)Switch1
{
    Switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(275, 3, 10, 15)];
    [Switch1 setOn:YES animated:YES];
    [Switch1 setOnTintColor:[UIColor blackColor]];
    Switch1.transform = CGAffineTransformMakeScale(0.6, 0.6);
    [cell1.contentView addSubview:Switch1];
    
}
-(void)addLogOutButton:(UITableView * ) tableview
{
    UIButton* logOut = [[UIButton alloc]initWithFrame:CGRectMake(0, 320, 320, 44)];
    [logOut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    logOut.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    logOut.titleLabel.textAlignment = NSTextAlignmentCenter;
    logOut.backgroundColor = [UIColor whiteColor];
    [logOut setTitle:@"退出当前登录" forState:(UIControlStateNormal)];



    [tableview addSubview:logOut];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HeightforCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

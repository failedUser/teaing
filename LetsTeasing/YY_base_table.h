//
//  YY_base_table.h
//  LetsTeasing
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YY_base_table : UITableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign) NSInteger countOF;
@property(nonatomic,assign) NSArray * cellContent;
@property(nonatomic,assign) NSMutableArray * arrayForCell;
@property(nonatomic,assign) CGFloat    heightTable;


-(void)didseleted;



@end
//
//  YY_content_table.h
//  LetsTeasing
//
//  Created by apple on 16/7/2.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YY_content_table :UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign) NSInteger countOF;
@property(nonatomic,assign) NSArray * cellContent;
-(void)setArray:(NSArray*)Array;
@end

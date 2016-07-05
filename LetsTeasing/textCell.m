//
//  textCell.m
//  LetsTeasing
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "textCell.h"


@implementation textCell
//这个是被引用之后第一个加载的函数，返回self，即UItableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm:ss SS"];
        
        
        _dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 15)];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        _dataLabel.text =dateString;

        
        
        _namelabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 3, 50, 15)];
  
        _namelabel.text = @"yy";

        _TextLabel = [[UILabel alloc]init];
//        _TextLabel.backgroundColor = [UIColor grayColor];
        //需要顶端对其？？
    
        
//        _TextLabel.textAlignment =NSTextAlignmentJustified;
//        [_TextLabel setContentMode:UIViewContentModeTop];
       
        //修改字体的大小
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:13.0];
        //创建完字体格式之后就告诉cell

        _TextLabel.font = newFont;
        _namelabel.font = newFont;
        _dataLabel.font = newFont;

        [self.contentView addSubview:_dataLabel];
        [self.contentView addSubview:_TextLabel];
        [self.contentView addSubview:_namelabel];
    }
    return self;
}





@end

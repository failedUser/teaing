//
//  YY_TextView.h
//  LetsTeasing
//
//  Created by apple on 16/7/3.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YY_TextView : UITextView
{
       UILabel *_placehoderLbl;//提示框
}
@property (nonatomic,strong) UIColor            * placehoderColor;
@property (nonatomic,copy)   NSString           * placeHoder;
@property (nonatomic,strong) UILabel            * Under_line;
@property (nonatomic,strong) UIImageView        * PlaceHoder_Image;
@property (nonatomic,strong) NSLayoutConstraint * constrainH;//高度约束

@end

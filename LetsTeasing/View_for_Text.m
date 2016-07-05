//
//  View_for_Text.m
//  LetsTeasing
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "View_for_Text.h"

@interface View_for_Text()

@end
@implementation View_for_Text

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViewForText];
        [self addSendBUtton];
        //4.监听键盘的弹起和收缩
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    
    
 
    return self;
}
- (void)dealloc{
    //移除所有通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)addViewForText
{
    
//    UIView * baseVIew = [[UIView alloc]initWithFrame:CGRectMake(0, HeightForTable, 320, 30)];
//    [self addSubview:baseVIew];
    
    UILabel *  line = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 300, 1)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
    self.yy_text  = [[YY_TextView alloc]initWithFrame:CGRectMake(5, 5, 280, 22)];
    self.yy_text.constrainH = self.constrainH;
//    self.yy_text.popView = self.view;
    //    [self.view addSubview:_yy_text];
    [self addSubview:self.yy_text];
}
-(void)addSendBUtton
{
    _send_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_send_btn setFrame:CGRectMake(285, 0, 30, 30)];
    UIImage* image =[UIImage imageNamed:@"send.png"] ;
    [_send_btn setImage: [self OriginImage:image scaleToSize:CGSizeMake(15, 15)] forState:UIControlStateNormal];
    
    [self addSubview:_send_btn];
}
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size); //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage; //返回的就是已经改变的图片
}

- (void)keyBoardChange:(NSNotification *)note{
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.popView.frame.size.height;
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.popView.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
}

@end
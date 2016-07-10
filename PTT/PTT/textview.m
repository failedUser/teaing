//
//  textview.m
//  PTT
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "textview.h"
#define sfont 30

@implementation textview
//-(void)initWith
//{
//    _text_Font = [UIFont fontWithName:@"yeuyin" size:sfont];
//    self.font = _text_Font;
//}

//自定义光标宽度和大小
- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    CGRect originalRect = [super caretRectForPosition:position];

    originalRect.size.height = self.font.lineHeight/5;
    originalRect.size.width = 10;
    originalRect.origin.y = sfont;
    return originalRect;
}


@end

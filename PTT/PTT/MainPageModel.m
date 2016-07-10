//
//  MainPageModel.m
//  PTT
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "MainPageModel.h"
#import "BmobSDK/Bmob.h"
#import "model.h"

@implementation MainPageModel
-(id)initWithDelegate:(id<FxOperationDelegate>)delegate dict:(NSMutableDictionary*) dict
{
    self = [super init];
    if (self) {
        _adegelete = delegate;
//        [self getObjectFromBomob];
    }
    
    return self;
}
//data operation from bmob

//get data and add in info
//得到某行数据

- (void)opSuccess:(NSMutableDictionary *)dict
{
    model *info =[model MainModelInfo:dict];
    [_adegelete opSuccess:info];
}
//-(void)cacheFordict:(NSMutableDictionary *)dict
//{
//
//
//   _DIct = [NSMutableDictionary dictionaryWithObject:dict forKey:[dict objectForKey:@"numberOfSaidWords"]];
//    NSLog(@"%@",[_DIct objectForKey:@"1"]);
//
//}
@end

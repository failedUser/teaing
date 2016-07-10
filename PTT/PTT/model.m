//
//  model.m
//  PTT
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "model.h"

@implementation model

+(instancetype )MainModelInfo:(NSMutableDictionary*)DICT
{
    
    model * info = [[model alloc]init];
    info.YY_Id =[DICT  objectForKey:@"objectId"];
    info.yy_number =[DICT objectForKey:@"numberOfSaidWords"];
    info.YY_name =[DICT objectForKey:@"playerName"];
    info.YY_saidWord =[DICT objectForKey:@"saidWord"];
    return info;
}

@end

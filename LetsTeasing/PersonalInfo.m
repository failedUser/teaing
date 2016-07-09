//
//  PersonalInfo.m
//  LetsTeasing
//
//  Created by apple on 16/7/6.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "PersonalInfo.h"

@implementation PersonalInfo

+(instancetype)initwithInfo:(NSMutableDictionary *) dict
{
    PersonalInfo * info = [[PersonalInfo alloc]init];
    info.saidWord =[dict objectForKey:@"saidWord"];
    info.Num = [dict objectForKey:@"numberOfSaidWords"];
    info.Name = [dict objectForKey:@"playerName"];
    info.ID = [dict objectForKey:@"objectId"];
    return info;
}


@end

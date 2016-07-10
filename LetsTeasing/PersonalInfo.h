//
//  PersonalInfo.h
//  LetsTeasing
//
//  Created by apple on 16/7/6.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalInfo : NSObject

@property(nonatomic,assign) NSString * ID;
@property(nonatomic,assign) NSNumber * Num;
@property(nonatomic,assign) NSString * Name;
@property(nonatomic,assign) NSString * saidWord;
+(instancetype)initwithInfo:(NSMutableDictionary *) dict;
@end

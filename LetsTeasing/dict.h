//
//  dict.h
//  LetsTeasing
//
//  Created by apple on 16/7/9.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dict : NSObject


@property(nonatomic,strong) NSMutableDictionary * DICT;
-(void)DICTaddDIct:(NSMutableDictionary*)dict key:(NSString*)num;
-(NSMutableDictionary*)neirong;
-(NSInteger)numberOfUnReadNews:(NSMutableDictionary *)dict;
@end

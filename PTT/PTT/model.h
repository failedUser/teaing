//
//  model.h
//  PTT
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject
@property(nonatomic,assign) NSString* YY_Id;
@property(nonatomic,assign) NSString* YY_saidWord;
@property(nonatomic,assign) NSString* YY_name;
@property(nonatomic,assign) NSNumber* yy_number;
+(instancetype )MainModelInfo:(NSMutableDictionary*)DICT;
@end

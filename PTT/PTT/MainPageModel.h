//
//  MainPageModel.h
//  PTT
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "model.h"
@protocol FxOperationDelegate <NSObject>

- (void)opSuccess:(id)data;
@end
@interface MainPageModel : NSObject
@property(nonatomic,weak)id<FxOperationDelegate> adegelete;

-(id)initWithDelegate:(id<FxOperationDelegate>)delegate dict:(NSMutableDictionary*) dict;

@end

//
//  ViewController.m
//  PTT
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "ViewController.h"
#import "BmobSDK/Bmob.h"
#import "operation.h"
#import "textview.h"
#import "MainPageModel.h"


@interface ViewController ()<UITextViewDelegate,FxOperationDelegate>

@property(nonatomic,assign) id age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    textview * text = [[textview alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
//    text.delegate = self;
//    text.backgroundColor = [UIColor whiteColor];
//    text.font = [UIFont fontWithName:@"yueyin" size:50];
//    [[UITextView appearance]setTintColor:[UIColor grayColor]];
//
//      [self.view addSubview:text];
//    
//    operation * ope = [[operation alloc]init];
//    [ope getData:@"OvwL4LL4" conString:@"playerName"];
//    [BmobObject objectWithoutDataWithClassName:@"fuefsuihfgs" objectId:@"ueyihiwhwiuf"];
//    //创建一张表 并且为他添加列和内容，如果表已经存在则直接添加内容
//    
//   BmobObject* gameScore = [BmobObject objectWithClassName:@"yueyinaaa"];
////    [gameScore setObject:@"nihao" forKey:@"10010"];
//     [gameScore setObject:@"小明" forKey:@"playerName"];
//     [gameScore setObject:[NSNumber numberWithBool:YES] forKey:@"cheatMode"];
//     [gameScore setObject:[NSNumber numberWithInteger:1000] forKey:@"age"];
//    [gameScore setObject:@"你去吃屎吧" forKey:@"saidword"];
//    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//        //进行操作
//    }];
    //将每一条数据封装成一个ios对象
//    arry = [NSMutableArray arrayWithCapacity:100];
//    [self getObjectFromBomob];
//    NSString *make = @"Honda";
//    NSString *(^getFullCarName)(NSString *) = ^(NSString *model) {
//        return [make stringByAppendingFormat:@" %@", model];
//    };
//    NSLog(@"%@", getFullCarName(@"Accord"));    // Honda Accord
//    model * model = [[moedel alloc]init];
//    model.adegelete = self;
//    NSLog(@"%@",model.)
//    NSLog(@"%@",model.dict);
}
//-(void)getObjectFromBomob
//{
//    
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"GameScore"];
//    //查找GameScore表的数据
//    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
//        for (BmobObject *obj in array) {
//        //也就是在数组中查询obj对象
////            str = [obj objectForKey:@"numberOfSaidWords"];
////            NSNumber * num =  [obj objectForKey:@"numberOfSaidWords"];
////            NSString * str = [obj objectForKey:@"saidWord"];
//            NSString * name =[obj objectForKey:@"playerName"];
////            NSString * Id  = [obj objectForKey:@"objectId"];
//            NSMutableArray * Muarry = [NSMutableArray arrayWithCapacity:100];
//            [Muarry setValue:name forKey:@"playerName"];
//            [self add:Muarry];
//        }
//  
//    }];
//}
//-(void)add:(NSMutableArray * )arry1
//{
//    arry = arry1;
//}
-(void)getObjectFromBomob
{
    
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"GameScore"];
    //查找GameScore表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            
            NSNumber * num =  [obj objectForKey:@"numberOfSaidWords"];
            NSString * str = [obj objectForKey:@"saidWord"];
            NSString * name =[obj objectForKey:@"playerName"];
            NSString * Id  = [obj objectForKey:@"objectId"];
            [self addObjectForDic:num PlayerName:name Words:str ID:Id];
            NSLog(@"1%@",name);
        }
    }];
}
//把每一组数据传入字典中
-(void)addObjectForDic:(NSNumber *)numb PlayerName:(NSString*) Name Words:(NSString*)SaidWord ID:(NSString*)bgdID
{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]initWithCapacity:1000];
    [dict setObject:Name forKey:@"playerName"];
    NSLog(@"2%@",[dict objectForKey:@"playerName"]);
    [dict setObject:SaidWord forKey:@"saidWord"];
    [dict setObject:bgdID forKey:@"objectId"];
    [dict setObject:numb forKey:@"numberOfSaidWords"];
    MainPageModel * op = [[MainPageModel alloc]initWithDelegate:self dict:dict];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

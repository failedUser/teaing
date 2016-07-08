//
//  ViewController.m
//  LetsTeasing
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "navigation.h"
#import "YY_base_table.h"
#import "Personal_centerViewController.h"
#import "YY_TextView.h"
#import "View_for_Text.h"
#import "JCAlertView.h"

//动画时间
#define kAnimationDuration 0.1
//view高度
#define kViewHeight 40
//cell
#define defaultHeigeht  30
#define addHeight 10

#define  HeightForTable SCREEN_HEIGHT*(538.0/568.0)
#define TextBackGroundVIewHeight SCREEN_HEIGHT*(30.0/568.0)
#define TextBackGroundVIewY SCREEN_HEIGHT*(538.0/568.0)
@interface ViewController ()<UITextViewDelegate,UITableViewDelegate,UITextViewDelegate,UITextViewDelegate>
{
    
    NSMutableArray * ScellContent;
}
@property(nonatomic,strong) UILabel             * title_label;
@property(nonatomic,strong) UITableView         * table_Center;
@property(nonatomic,strong) UIView              * text_view;
@property(nonatomic,strong) UILabel             * line;
@property(nonatomic,strong) UITextView          * innput_textView;
@property(nonatomic,strong) YY_base_table       * yy_table;
@property(nonatomic,strong) YY_TextView         * yy_text;
@property (weak, nonatomic) NSLayoutConstraint  * constrainH;
@property(nonatomic,strong) View_for_Text       * baseVIew;
@property(nonatomic,strong) JCAlertView         * Alertview;
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    //添加键盘的监听事件
    
    //注册通知,监听键盘弹出事件
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
////    注册通知,监听键盘消失事件
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 ScellContent = [NSMutableArray arrayWithObjects:@"你你你你你你你你你你",@"1",@"妮妮", @"你你你你你你你你你你",@"1",@"妮妮"@"你你你你你你你你你你",@"1",@"妮妮"@"你你你你你你你你你你",@"1",@"妮妮",@"你你你你你你你你你你",@"1",@"妮妮", @"你你你你你你你你你你",@"1",@"妮妮"@"你你你你你你你你你你",@"1",@"妮妮"@"你你你你你你你你你你",nil];
 
    [self configNavigation];
    //实例化YY—table
    [self addTableview];
    [self addViewForText];
    //        [_baseVIew NOtification:YES];
    [self AutolayOutWithMasonry];
    //添加手势
    UITapGestureRecognizer * Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesBegan)];
    [_yy_table addGestureRecognizer:Gesture];
    
    
    
    
}

-(void)configNavigation
{
    //设置导航栏的标题
    self.navigationItem.title = @"一起来吐槽";
    //设置导航栏的背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    //设置导航栏标题字体的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Arial" size:13.0],NSFontAttributeName, nil]];

    //导航栏左边按钮
//    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selfCenter)];
    UIImage * image = [self scaleImage:[UIImage imageNamed:@"me.png"] toScale:0.3];
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(selfCenter) ];
    //导航栏左边按钮颜色
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchToSm)];
    //导航栏右边边按钮颜色
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    //修改这个可以修改所有的背景色、但是不能单独在页面上改所有导航栏上的属性，只能在跟页面修改
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)addTableview
{
    _yy_table = [[YY_base_table alloc]init];
    _yy_table.cellContent = ScellContent;
    //整理逻辑的关键牌，我想写个监听
    _yy_table.backgroundColor = [UIColor grayColor];
    NSInteger  heighett = 0 ;
    [self longGesture:YES];
//       [self TavbleViewCellSeletShowAlert:YES];
    heighett = HeightForTable + self.yy_table.heightTable;
    [_yy_table setFrame:CGRectMake(0, 0, SCREEN_WIDTH, heighett)];
    [self.view addSubview:_yy_table];

    
}

-(void)ketBoardIschange
{
        [_baseVIew.yy_text resignFirstResponder];
}
-(void)addViewForText
{
    
   _baseVIew  = [[View_for_Text alloc]initWithFrame:CGRectMake(0, TextBackGroundVIewY, SCREEN_WIDTH, TextBackGroundVIewHeight)];
    _baseVIew.constrainH =self.constrainH;
    _baseVIew.popView =self.view;
    _baseVIew.yy_text.delegate =self;
        [self.view addSubview:_baseVIew];
    [_baseVIew.send_btn addTarget:self action:@selector(sendText) forControlEvents:UIControlEventTouchUpInside];

    }

//左边按钮的操作
-(void)selfCenter
{
    Personal_centerViewController * perV= [[Personal_centerViewController alloc]init];
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"";
//    UIImage * image =  [UIImage imageNamed:@"arrow.png"];
//    [backbutton setImage:[self scaleImage:image toScale:0.5]];
    [backbutton setTintColor:[UIColor whiteColor]];
    self.navigationItem.backBarButtonItem = backbutton;
    [self.navigationController pushViewController:perV animated:YES];
}
//右边按钮的操作
-(void)searchToSm
{
    NSLog(@"查找什么东西");
    
}
- (NSInteger) heightForString:(UITextView *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    NSInteger height = sizeToFit.height;
    return height;
    
}
-(void)sendText
{

   NSString * message = [_baseVIew.yy_text.text copy];
    if (message.length == 0) {
        [_baseVIew.yy_text isFirstResponder];
    }else
    {
    [self MessageManager:message];
    [_baseVIew.yy_text resignFirstResponder];
    [self.yy_table reloadData];
    //滑到更新的那一行
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:ScellContent.count-1 inSection:0];
    [self.yy_table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
     _baseVIew.yy_text.text = @"";
     }

}
-(void)MessageManager:(NSString*) message
{
    if (message!= 0) {
        [ScellContent addObject:message];
    }
    
}

//键盘退出
-(void)touchesBegan
{
    //隐藏键盘
    [_baseVIew.yy_text resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//修改图片尺寸
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize

{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
                                [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
                                UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                                UIGraphicsEndImageContext();
                                
                                return scaledImage;
                                
                                }






//给Cell添加长按手势
-(void)longGesture:(BOOL)bools
{
    if (bools) {
        UILongPressGestureRecognizer * longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongGesture:)];
        longGesture.minimumPressDuration = 0.5;
        [_yy_table addGestureRecognizer:longGesture];
    }
    else{
        NSLog(@"长按事件失败");
    }
    
    
}
-(void)LongGesture:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:_yy_table];
        
        NSIndexPath * indexPath = [_yy_table indexPathForRowAtPoint:point];
        
        if(indexPath == nil) NSLog(@"nimeia");
        else{
            [_baseVIew.yy_text resignFirstResponder];
            [self showAlertWithOneButton];
            [_baseVIew dealloc1];
            //写完发送事件之后添加一下就好了
            
        }
        
    }
    
}
- (void)showAlertWithOneButton{
    NSArray * aaa = [NSArray arrayWithObjects:@"今天是个好日子",@"明天是个好日子明天是个好日子明天是个好日子明天是个好日子明天是个好日子",@"后天也是个好日子",@"大后天不是个好日子",@"好日子好日子",@"1",@"2",@"3",@"4", nil];
    //    [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"发送" Click:nil];
    [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa];
    
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [_baseVIew  addObserver];
    return YES;
}
-(void)AutolayOutWithMasonry
{
    
}

@end

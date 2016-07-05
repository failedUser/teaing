// About me
// GitHub: https://github.com/HJaycee/JCAlertView
// Blog: http://blog.csdn.net/hjaycee
// Email: hjaycee@163.com (Feel free to connect me)

// About you
// Add "Accelerate.frameWork" first in your project otherwise error!

#import <UIKit/UIKit.h>
#import "View_for_Text.h"

// maybe useful
UIKIT_EXTERN NSString *const JCAlertViewWillShowNotification;

typedef void(^clickHandle)(void);

typedef void(^clickHandleWithIndex)(NSInteger index);

typedef NS_ENUM(NSInteger, JCAlertViewButtonType) {
    JCAlertViewButtonTypeDefault = 0,
    JCAlertViewButtonTypeCancel,
    JCAlertViewButtonTypeWarn
};

@interface JCAlertView : UIView
@property(nonatomic,strong) View_for_Text * basetextView;



// ------------------------Show AlertView with title and message----------------------

//
//+ (void)showOneButtonWithTitle:(NSString *)title array:(NSArray *)Array ButtonType:(JCAlertViewButtonType)buttonType ButtonTitle:(NSString *)buttonTitle Click:(clickHandle)click;
+(void)showOneButtonWithTitle:(NSString *)title array:(NSArray *)Array;



// ------------------------Show AlertView with customView-----------------------------

// create a alertView with customView.
// 'dismissWhenTouchBackground' : If you don't want to add a button on customView to call 'dismiss' method manually, set this property to 'YES'.
//- (instancetype)initWithCustomView:(UIView *)customView dismissWhenTouchedBackground:(BOOL)dismissWhenTouchBackground;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
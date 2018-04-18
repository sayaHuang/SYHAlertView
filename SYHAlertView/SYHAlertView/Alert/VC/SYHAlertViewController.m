//
//  SYHAlertViewController.m
//  SYHAlertView
//
//  Created by saya on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "SYHAlertViewController.h"
#import "SYHMacros.h"
#import "SYHAlertActionModel.h"
#import "UIColor+custom.h"
#import "Masonry.h"
#import "ImageUtils.h"

static const CGFloat merge = 50;
static const NSInteger base_tag = 1234;

@interface SYHAlertViewController ()

@property(nonatomic, strong)UIViewController*   targetVC;

@property(nonatomic, copy)NSString*                             alertTitle;
@property(nonatomic, copy)NSString*                      message;
@property(nonatomic)SYHAlertViewControllerType           style;
@property(nonatomic, strong)NSArray<SYHAlertActionModel*>      *alertActions;


//界面相关
@property(nonatomic, assign)BOOL                notifiKeyboardHide;
@property(nonatomic, strong)UIView*             operateView; //操作视图
@property(nonatomic, strong)UIView*             btnsView;

@end

@implementation SYHAlertViewController

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message showViewController:(UIViewController*)viewController preferredStyle:(SYHAlertViewControllerType)preferredStyle alertActions:(NSArray<SYHAlertActionModel*>*)alertActions{
    
    return [[self alloc] initWithTitle:title message:message showViewController:viewController preferredStyle:preferredStyle alertActions:alertActions];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message showViewController:(UIViewController*)viewController preferredStyle:(SYHAlertViewControllerType)preferredStyle alertActions:(NSArray<SYHAlertActionModel*>*)alertActions
{
    if (self = [super init]) {
        self.alertTitle = title;
        self.message = message;
        self.style = preferredStyle;
        
        self.targetVC = viewController;
        self.alertActions = alertActions;
        
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexValue:ALERT_BACKGROUND_COLOR];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //必须在这里，否则动画无效
    [self constructUI];
}


- (void)constructUI
{
    //操作区背景
    _operateView = [[UIView alloc] init];
    _operateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_operateView];
    [self shakeToShow:_operateView];
    CGFloat operateViewWidth = SCREEN_WIDTH - 2 * merge;
    [_operateView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(operateViewWidth);
    }];
    
    //标题
    if (!self.alertTitle) {
        self.alertTitle = @"";
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.alertTitle;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor colorWithHexValue:MIAN_CONTENT_FONT_COLOR];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_operateView addSubview:titleLabel];
    
    //线
    UIImageView* lineImage = [ImageUtils createLineImageViewWithFrame:CGRectMake(0, 0, 100, 1) andColor:BORDER_COLOR];
    [_operateView addSubview:lineImage];
    
    //显示标题
    if (self.style == SYHAlertViewControllerWithTitle ) {
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_operateView);
            make.height.equalTo(AdaptedHeight(41));
        }];
        
        [lineImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.bottom);
            make.left.equalTo(_operateView);
            make.right.equalTo(_operateView);
            make.height.equalTo(ONE_PIXEL);
        }];
    }
    //隐藏标题
    else
    {
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_operateView);
            make.height.equalTo(0);
        }];
        
        [lineImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.bottom);
            make.left.equalTo(_operateView);
            make.right.equalTo(_operateView);
            make.height.equalTo(0);
        }];
    }
    
    UIView *messageContentView = [[UIView alloc] init];
    messageContentView.backgroundColor = [UIColor colorWithHexValue:@"0xffffffff"];
    [_operateView addSubview:messageContentView];
    [messageContentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineImage.bottom);
        make.left.equalTo(_operateView);
        make.right.equalTo(_operateView);
    }];
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.text = self.message;
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.textColor = [UIColor colorWithHexValue:MIAN_CONTENT_FONT_COLOR];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    [messageContentView addSubview:messageLabel];
    [messageLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_operateView).offset(AdaptedWidth(26));
        make.right.equalTo(_operateView).offset(AdaptedWidth(-26));
        make.top.equalTo(messageContentView).offset(AdaptedHeight(30));
    }];
    
    [messageContentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(messageLabel).offset(AdaptedHeight(28));
    }];
    
    
    //确认 取消 按键区域
    UIView *btnsView = [[UIView alloc] init];
    self.btnsView = btnsView;
    btnsView.backgroundColor = [UIColor colorWithHexValue:BACKGROUND_VIEW_GRAY];
    [_operateView addSubview:btnsView];
    [btnsView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(messageContentView.bottom);
        make.left.right.equalTo(_operateView);
        make.height.equalTo(AdaptedHeight(41));
    }];
    
    [_operateView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btnsView);
    }];
    
    
    CGFloat width = operateViewWidth / self.alertActions.count;
    UIButton *lastBtn;
    for (NSInteger i = 0; i < self.alertActions.count; ++i) {
        SYHAlertActionModel *action = self.alertActions[i];
        NSString *normalColor = action.style == SYHAlertActionConfirm ? MAINCOLOR_RED : NAVIGATION_BAR_BLACK_COLOR;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:action.actionTitle forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [button setTitleColor:[UIColor colorWithHexValue:@"0xffffffff"] forState:UIControlStateNormal];
        CGRect rect = CGRectMake(0, 0, 10, 70);
        UIImage* normalImage = [ImageUtils createRectImageByColor:normalColor andFrame:rect];
        [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        UIImage* disableImage = [ImageUtils createRectImageByColor:MAIN_DEEP_GRAY andFrame:rect];
        [button setBackgroundImage:disableImage forState:UIControlStateDisabled];
        UIImage* selectedImage = [ImageUtils createRectImageByColor:MAIN_DEEP_GRAY andFrame:rect];
        [button setBackgroundImage:selectedImage forState:UIControlStateSelected];
        [button.layer setMasksToBounds:YES];
        
        button.tag = base_tag + i;
        [button addTarget:self action:@selector(onBottomActionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnsView addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastBtn ? lastBtn.right : self.btnsView.left);
            make.width.equalTo(width);
            make.height.equalTo(self.btnsView);
            make.centerY.equalTo(self.btnsView);
        }];
        lastBtn = button;
    }
}

- (void)onBottomActionBtn:(UIButton *)sender
{
    //防止多次点击
    sender.enabled = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSInteger index = sender.tag - base_tag;
    SYHAlertActionModel *action = self.alertActions[index];
    if (action.actionHandler) {
        action.actionHandler();
    }
}

#pragma mark - animatioin

- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation * popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.35;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05f, 1.05f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @0.8f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [aView.layer addAnimation:popAnimation forKey:nil];
}


- (void)removeAlertView
{
    [UIView animateWithDuration:0.15 animations:^{
        _operateView.alpha = 0;
        _operateView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        if (_notifiKeyboardHide) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end

//
//  FirstViewController.m
//  LearnStatusBar
//
//  Created by feijiang-DT1 on 15/11/6.
//  Copyright (c) 2015年 wulian. All rights reserved.
//

#import "FirstViewController.h"
#import "StatusMessageHandle.h"
#import "MessageView.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation FirstViewController

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

//- (void)setNeedsFocusUpdate {
//    
//}

//- (void)setNeedsStatusBarAppearanceUpdate {
//    //这个和UIView的setNeedsDisplay原理差不多(调用UIView对象的setNeedsDisplay方法后，系统会在下次页面刷新时，调用重绘该view，系统最快能1秒刷新60次页面，具体要看程序设置
//    //1.调用-preferredStatusBarStyle
//}

//- (UIViewController *)childViewControllerForStatusBarStyle {
//    //这个接口也很重要，默认返回值为nil。当我们调用setNeedsStatusBarAppearanceUpdate时，系统会调用application.window的rootViewController的preferredStatusBarStyle方法，我们的程序里一般都是用UINavigationController做root，如果是这种情况，那我们自己的UIViewController里的preferredStatusBarStyle根本不会被调用
//    //我们要子类化一个UINavigationController
//    return self.topViewController;
//}


-(void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[self performSelector:@selector(showMessageEvent) withObject:nil afterDelay:5.f];
    _timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(showMessageEvent) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_timer invalidate];
}

- (void)showMessageEvent {
    [StatusMessageHandle showAndHideDuration:2.f];
    [StatusMessageHandle showWithView:[MessageView messageViewWithTitle:@"YouXianMing" backgroundColor:[UIColor whiteColor]]
                     hideAfterSeconds:3.f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

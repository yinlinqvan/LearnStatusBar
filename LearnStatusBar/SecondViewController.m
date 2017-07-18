//
//  SecondViewController.m
//  LearnStatusBar
//
//  Created by feijiang-DT1 on 15/11/6.
//  Copyright (c) 2015年 wulian. All rights reserved.
//

#import "SecondViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SecondViewController ()
@property (nonatomic, strong) UIView * statusBarColorView;
@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //禁用translucent属性，可以在Storyboard中选中导航栏，然后在Attribute Inspectors中，取消translucent的勾选。
    
    //用xib可视化编程设置navigationBar属性
    
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setBackgroundColor:[UIColor lightGrayColor]];
    //[[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
    //[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor lightGrayColor]];
    //[[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x067AB5)];
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appcoda-logo.png"]];
    //NSShadow *shadow = [[NSShadow alloc] init];
    //shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    //shadow.shadowOffset = CGSizeMake(0, 1);
    //[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, shadow, NSShadowAttributeName, [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    //[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _statusBarColorView = [[UIView alloc]initWithFrame:[[UIApplication sharedApplication] statusBarFrame]];
    [_statusBarColorView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_statusBarColorView];
    
    //手势
    //[self setHidesBottomBarWhenPushed:YES];
    [self.navigationController setHidesBarsOnSwipe:YES];//滚动隐藏导航栏/标签栏
    //[self.navigationController setHidesBarsOnTap:YES];//点击隐藏导航栏/标签栏,与按钮点击冲突
    //[self.navigationController setHidesBarsWhenKeyboardAppears:YES];
    //[self.navigationController setHidesBarsWhenVerticallyCompact:YES];
    //[self.navigationController setHidesBottomBarWhenPushed:YES];
    //navigationBar的手势
    //self.navigationController.barHideOnSwipeGestureRecognizer;
    //self.navigationController.barHideOnTapGestureRecognizer;
}

- (IBAction)hideNavigationBar:(id)sender {
    //获取navigationBar的颜色
    [_statusBarColorView setBackgroundColor:[UINavigationBar appearance].barTintColor];//失效
    [_statusBarColorView setBackgroundColor:self.navigationController.navigationBar.barTintColor];
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

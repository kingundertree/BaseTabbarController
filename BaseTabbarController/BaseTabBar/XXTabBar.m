//
//  TabBar.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XXTabBar.h"

@interface XXTabBar ()<tabBarFootDelegate>
@property(nonatomic, strong) NSArray *viewcontrollers;
@property(nonatomic, assign) NSInteger seletedTabBarIndex;
@property(nonatomic, strong) TabBarFoot *tabBarFootView;
@property(nonatomic, strong) UINavigationController *defaultVC;
@end

@implementation XXTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.seletedTabBarIndex = 0;
        self.defaultIndex = 0;
    }
    return self;
}

- (id)initTabBarWithVC:(NSArray *)viewcontrollers tabBarImages:(NSArray *)tabBarImages tabBarTitles:(NSArray *)tabBarTitles{
    self.viewcontrollers = [[NSArray alloc] initWithArray:viewcontrollers];
    
    self.defaultVC = (UINavigationController *)[self.viewcontrollers objectAtIndex:self.defaultIndex];
    self.defaultVC.view.frame = CGRectMake(0, 0, screenWidth, screenHeight - TabBarFootViewHeight);
    [self.view addSubview:self.defaultVC.view];
    
    self.tabBarFootView = [[TabBarFoot alloc] initTabBarFootView:tabBarImages tabBatTitles:tabBarTitles];
    self.tabBarFootView.footDelegate = self;
    [self.view addSubview:self.tabBarFootView];
    
    return self;
}

- (void)setDefaultTabBarIndex:(NSInteger)index{
    if (self.defaultIndex == index) {
        return;
    }
    self.defaultIndex = index;
    
    
    //移除原view
    [self.defaultVC.view removeFromSuperview];
    self.defaultVC = nil;

    //设置新view视图
    self.defaultVC = (UINavigationController *)[self.viewcontrollers objectAtIndex:self.defaultIndex];
    self.defaultVC.view.frame = CGRectMake(0, 0, screenWidth, screenHeight - TabBarFootViewHeight);
    [self.view insertSubview:self.defaultVC.view belowSubview:self.tabBarFootView];

    [self.tabBarFootView setSelectedTabBar:index status:NO];
    
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(tabBarDidSelected:)]) {
        [self.tabBarDelegate tabBarDidSelected:self.defaultIndex];
    }
}

#pragma mark --TabBarFootDelegate
- (void)tabBarFootWillSelect:(NSInteger)selectTabBarIndex
{
    [self setDefaultTabBarIndex:selectTabBarIndex];
}

- (void)hideTabBar:(BOOL)animate{
    CGRect frame = self.tabBarFootView.frame;
    frame.origin.y += TabBarFootViewHeight;

    if (animate) {
        [UIView animateWithDuration:0.4 animations:^{
            self.tabBarFootView.frame = frame;
        } completion:^(BOOL finished) {
            nil;
        }];
    }else{
        self.tabBarFootView.frame = frame;
    }
}
- (void)showTabBar:(BOOL)animate{
    CGRect frame = self.tabBarFootView.frame;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        if (frame.origin.y == screenHeight - TabBarFootViewHeight) {
            return;
        }
    }else{
        if (frame.origin.y == screenHeight - TabBarFootViewHeight - 20) {
            return;
        }
    }
    
    frame.origin.y -= TabBarFootViewHeight;
    
    if (animate) {
        [UIView animateWithDuration:0.4 animations:^{
            self.tabBarFootView.frame = frame;
        } completion:^(BOOL finished) {
            nil;
        }];
    }else{
        self.tabBarFootView.frame = frame;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- System method
- (NSInteger)getSelectedTabBarIndex{
    return self.seletedTabBarIndex;
}
- (void)switchToTab:(NSInteger)index{
    
}
@end

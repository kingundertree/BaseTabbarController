//
//  TabBar.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()<tabBarFootDelegate>
@property(nonatomic, strong) NSArray *viewcontrollers;
@property(nonatomic, assign) NSInteger seletedTabBarIndex;
@property(nonatomic, strong) TabBarFoot *tabBarFootView;
@property(nonatomic, strong) UIViewController *defaultVC;
@end

@implementation TabBar

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
    
    self.defaultVC = (UIViewController *)[self.viewcontrollers objectAtIndex:self.defaultIndex];
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
    self.defaultVC = (UIViewController *)[self.viewcontrollers objectAtIndex:self.defaultIndex];
    [self.view insertSubview:self.defaultVC.view belowSubview:self.tabBarFootView];

    [self.tabBarFootView setSelectedTabBar:index status:NO];
}

#pragma mark --TabBarFootDelegate
- (void)tabBarFootWillSelect:(NSInteger)selectTabBarIndex
{
    [self setDefaultTabBarIndex:selectTabBarIndex];
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

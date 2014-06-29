//
//  TabBar.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBar.h"
#import "TabBarFoot.h"

@interface TabBar ()
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
        _seletedTabBarIndex = 0;
        _defaultIndex = 0;
    }
    return self;
}

- (instancetype)initTabBarWithVC:(NSArray *)viewcontrollers tabBarImages:(NSArray *)tabBarImages tabBarTitles:(NSArray *)tabBarTitles{
    _viewcontrollers = [[NSArray alloc] initWithArray:viewcontrollers];
    
    _defaultVC = (UIViewController *)[_viewcontrollers objectAtIndex:_defaultIndex];
    
    [self.view addSubview:_defaultVC.view];
    
    _tabBarFootView = [[TabBarFoot alloc] initTabBarFootView:tabBarImages tabBatTitles:tabBarTitles];
    [self.view addSubview:_tabBarFootView];
    
    return self;
}

- (void)setDefaultTabBarIndex:(NSInteger)index{
    [_tabBarFootView setSelectedTabBar:0 status:NO];
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
    return _seletedTabBarIndex;
}
- (void)switchToTab:(NSInteger)index{
    
}
@end

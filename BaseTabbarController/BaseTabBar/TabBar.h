//
//  TabBar.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarFoot.h"

@interface TabBar : UIViewController


@property(nonatomic, assign) NSInteger defaultIndex;

/*
    tabBar 初始化方法
 */
- (id)initTabBarWithVC:(NSArray *)viewcontrollers tabBarImages:(NSArray *)tabBarImages tabBarTitles:(NSArray *)tabBarTitles;

//设置默认选中index
- (void)setDefaultTabBarIndex:(NSInteger)index;
//获取选中tab 值
- (NSInteger)getSelectedTabBarIndex;
//跳转至指定tab
- (void)switchToTab:(NSInteger)index;


@end

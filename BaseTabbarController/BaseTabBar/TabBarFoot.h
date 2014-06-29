//
//  TabBarFoot.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarFoot : UIView


/*
    初始化
 */
- (instancetype)initTabBarFootView:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles;


//设置选中tabBar样式
- (void)setSelectedTabBar:(NSInteger)index status:(BOOL)status;
@end

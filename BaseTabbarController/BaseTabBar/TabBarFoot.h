//
//  TabBarFoot.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tabBarFootDelegate <NSObject>
- (void)tabBarFootWillSelect:(NSInteger)selectTabBarIndex;
@end

@interface TabBarFoot : UIView
@property(nonatomic, assign) id<tabBarFootDelegate> footDelegate;
@property(nonatomic, assign) NSInteger defaultIndex;
/*
    初始化
 */
- (id)initTabBarFootView:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles;

//设置选中tabBar样式
- (void)setSelectedTabBar:(NSInteger)index status:(BOOL)status;
@end

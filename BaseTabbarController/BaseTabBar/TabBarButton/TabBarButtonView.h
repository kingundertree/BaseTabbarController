//
//  TabBarButtonView.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-30.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButtonView : UIView
@property(nonatomic, strong) NSString *iconNormal;
@property(nonatomic, strong) NSString *iconSelected;

//设置按钮状态
- (void)setStatus:(BOOL)isSeleted;

- (id)initWithData:(CGRect)frame iconNormal:(NSString *)iconNormal iconSelected:(NSString *)iconSelected tabBarTitle:(NSString *)tabBarTitle;

@end

//
//  TabBarOneViewController.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-29.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarOneViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UIViewController *mainVC;

@end

//
//  MainViewController.h
//  BaseTabbarController
//
//  Created by xiazer on 14-6-29.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBar.h"
#import "TabBarOneViewController.h"
#import "TabBarTwoViewController.h"
#import "TabBarThreeViewController.h"

@interface MainViewController : UIViewController
@property(nonatomic, strong) TabBar *tabBar;
@end

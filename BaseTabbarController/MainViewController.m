//
//  MainViewController.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-29.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<XXTabBarDelegate>

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (XXTabBar *)tabBarView{
    if (!self.tabBar) {
        //initTabBar
        TabBarOneViewController *oneVC = [[TabBarOneViewController alloc] init];
        oneVC.mainVC = self;
        UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:oneVC];

        TabBarTwoViewController *twoVC = [[TabBarTwoViewController alloc] init];
        UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:twoVC];

        TabBarThreeViewController *threeVC = [[TabBarThreeViewController alloc] init];
        UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:threeVC];
        
        NSArray *bcArr = [[NSArray alloc] initWithObjects:oneNav,twoNav,threeNav, nil];
        NSArray *titArr = @[@"one",@"two",@"three"];
        NSArray *iconArr = @[@"tab_icon_home_normal@2x.png",@"tab_icon_home_select@2x.png",@"tab_icon_chat_normal@2x.png",@"tab_icon_chat_select@2x.png",@"tab_icon_user_normal@2x.png",@"tab_icon_user_select@2x.png"];

        self.tabBar = [[XXTabBar alloc] initTabBarWithVC:bcArr tabBarImages:iconArr tabBarTitles:titArr];
        self.tabBar.tabBarDelegate = self;
        
        [self.tabBar setDefaultTabBarIndex:1];
    }
    
    return self.tabBar;
}

- (void)hideTabBar:(BOOL)animate{
    [self.tabBar hideTabBar:animate];
}

- (void)showTabBar:(BOOL)animate{
    [self.tabBar showTabBar:animate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.view addSubview:self.tabBarView.view];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)tabBarDidSelected:(NSInteger)selectTabBarIndex{
    DLog(@"didselectTabBarIndex--->>%d",selectTabBarIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

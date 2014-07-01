//
//  TabBarOneViewController.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-29.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBarOneViewController.h"
#import "DetailViewController.h"
#import "MainViewController.h"

@interface TabBarOneViewController ()

@end

@implementation TabBarOneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    DLog(@"viewWillAppear");
    
    MainViewController *main = (MainViewController *)self.mainVC;
    [main showTabBar:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    DLog(@"viewDidDisappear");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"one";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UITableView *tableList;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        tableList= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-TabBarFootViewHeight) style:UITableViewStylePlain];
    }else{
        tableList= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-TabBarFootViewHeight -20-44) style:UITableViewStylePlain];
    }
    tableList.dataSource = self;
    tableList.delegate = self;
    tableList.separatorColor = [UIColor lightGrayColor];
    [self.view addSubview:tableList];
}

#pragma mark --UITableViewDataSourceDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"我来自-%d",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    MainViewController *main = (MainViewController *)self.mainVC;
    [main hideTabBar:YES];
    [self.navigationController pushViewController:detailVC animated:YES];
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

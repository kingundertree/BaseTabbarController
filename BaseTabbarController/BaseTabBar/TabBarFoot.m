//
//  TabBarFoot.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBarFoot.h"
#import "TabBarButton.h"
#import "TabBarButtonView.h"

@interface TabBarFoot ()
@property(nonatomic, strong) UIView *underLine;
@property(nonatomic, assign) float btnWidth;
@end

@implementation TabBarFoot
@synthesize footDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.defaultIndex = 0;
    }
    return self;
}

- (id)initTabBarFootView:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles{
    float originY;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        originY = screenHeight - TabBarFootViewHeight;
    }else{
        originY = screenHeight - TabBarFootViewHeight - 20;
    }
    DLog(@"originY-->>%f",originY);
    CGRect frame = CGRectMake(0, originY, screenWidth, TabBarFootViewHeight);
    self = [super initWithFrame:frame];
    self.backgroundColor = TabBarFootBackgoundColor;

    [self disPlayTabBarFoot:tabBarImages tabBatTitles:tabBatTitles];
    
    return self;
}

- (void)disPlayTabBarFoot:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles{
    self.btnWidth = screenWidth/tabBatTitles.count;
    
    for (int i = 0; i < tabBatTitles.count; i++) {
        TabBarButtonView *btnView = [[TabBarButtonView alloc] initWithData:CGRectMake(self.btnWidth*i, 0, self.btnWidth, TabBarFootViewHeight) iconNormal:[tabBarImages objectAtIndex:i*2] iconSelected:[tabBarImages objectAtIndex:i*2+1] tabBarTitle:[tabBatTitles objectAtIndex:i]];
        [self addSubview:btnView];

        TabBarButton *btn = [[TabBarButton alloc] initWithFrame:btnView.frame];
        btn.tag = i;
        [btn addTarget:self action:@selector(willSelectTabBar:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    self.underLine = [[UIView alloc] initWithFrame:CGRectMake(self.defaultIndex*self.btnWidth, TabBarFootViewHeight - 2, self.btnWidth, 2)];
    self.underLine.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.underLine];
}

- (void)willSelectTabBar:(TabBarButton *)btn{
    NSInteger tagIndex = btn.tag;
    if (self.defaultIndex == tagIndex) {
        return;
    }
    
    [self setSelectedTabBar:tagIndex status:YES];
    
    if (self.footDelegate && [self.footDelegate respondsToSelector:@selector(tabBarFootWillSelect:)]) {
        [self.footDelegate tabBarFootWillSelect:tagIndex];
    }
}

- (void)setSelectedTabBar:(NSInteger)index status:(BOOL)status{
    
    if (self.defaultIndex == index) {
        return;
    }
    
    self.defaultIndex = index;
    [UIView animateWithDuration:0.2 animations:^{
        self.underLine.frame = CGRectMake(self.defaultIndex*self.btnWidth, TabBarFootViewHeight - 2, self.btnWidth, 2);
    } completion:^(BOOL finished) {
        nil;
    }];
}
@end

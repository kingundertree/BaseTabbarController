//
//  TabBarFoot.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-27.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBarFoot.h"
#import "TabBarButton.h"

#define TabBarFootViewHeight 49.0
#define TabBarFootBackgoundColor [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]

@interface TabBarFoot ()
@property(nonatomic, strong) UIView *underLine;
@end


@implementation TabBarFoot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initTabBarFootView:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles{
    float originY;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        originY = screenHeight - TabBarFootViewHeight;
    }else{
        originY = screenHeight - TabBarFootViewHeight - 20;
    }
    
    CGRect frame = CGRectMake(0, originY, screenWidth, TabBarFootViewHeight);
    self = [super initWithFrame:frame];
    self.backgroundColor = TabBarFootBackgoundColor;

    [self disPlayTabBarFoot:tabBarImages tabBatTitles:tabBatTitles];
    
    return self;
}

- (void)disPlayTabBarFoot:(NSArray *)tabBarImages tabBatTitles:(NSArray *)tabBatTitles{
    float btnWidth = screenWidth/tabBatTitles.count;
    
    for (int i = 0; i < tabBatTitles.count; i++) {
        TabBarButton *btn = [[TabBarButton alloc] initWithData:CGRectMake(btnWidth*i, 0, btnWidth, TabBarFootViewHeight) iconNormal:[tabBarImages objectAtIndex:i*2] iconSelected:[tabBarImages objectAtIndex:i*2+1] tabBarTitle:[tabBatTitles objectAtIndex:i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(willSelectTabBar:) forControlEvents:UIControlEventTouchDragInside];
        [self addSubview:btn];
    }
    
    _underLine = [[UIView alloc] initWithFrame:CGRectMake(0, TabBarFootViewHeight - 4, btnWidth, 4)];
    _underLine.backgroundColor = [UIColor orangeColor];
    [self addSubview:_underLine];
}

- (void)willSelectTabBar:(TabBarButton *)btn{
    NSInteger tagIndex = btn.tag;
}

- (void)setSelectedTabBar:(NSInteger)index status:(BOOL)status{
    TabBarButton *btn = (TabBarButton *)[self viewWithTag:index];
    [btn setStatus:status];
}
@end

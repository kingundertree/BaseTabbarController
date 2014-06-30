//
//  TabBarButtonView.m
//  BaseTabbarController
//
//  Created by xiazer on 14-6-30.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "TabBarButtonView.h"

@interface TabBarButtonView ()
//@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UIImageView *iconImage;
@property(nonatomic, strong) UILabel *titleLab;
@end

@implementation TabBarButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithData:(CGRect)frame iconNormal:(NSString *)iconNormal iconSelected:(NSString *)iconSelected tabBarTitle:(NSString *)tabBarTitle{
    self = [super initWithFrame:frame];
    
    self.iconNormal = iconNormal;
    self.iconSelected = iconSelected;
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 14, 5, 28, 28)];
        self.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",iconNormal]];
        [self addSubview:self.iconImage];
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 12 - 4, self.frame.size.width, 12)];
        self.titleLab.textColor = [UIColor whiteColor];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.font = [UIFont systemFontOfSize:10];
        self.titleLab.text = tabBarTitle;
        [self addSubview:self.titleLab];
        
    }
    
    return self;
}
- (void)setStatus:(BOOL)isSeleted{
    if (isSeleted) {
        self.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.iconNormal]];
        self.titleLab.textColor = [UIColor whiteColor];
    }else{
        self.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.iconSelected]];
        self.titleLab.textColor = [UIColor lightTextColor];
    }
}

@end

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

- (instancetype)initWithData:(CGRect)frame iconNormal:(NSString *)iconNormal iconSelected:(NSString *)iconSelected tabBarTitle:(NSString *)tabBarTitle{
    self = [super initWithFrame:frame];
    
    _iconNormal = iconNormal;
    _iconSelected = iconSelected;
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        _bgView.userInteractionEnabled = YES;
//        _bgView.backgroundColor = [UIColor clearColor];
        
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 14, 5, 28, 28)];
        _iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",iconNormal]];
        [self addSubview:_iconImage];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 12 - 4, self.frame.size.width, 12)];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = [UIFont systemFontOfSize:10];
        _titleLab.text = tabBarTitle;
        [self addSubview:_titleLab];
        
    }
    
    return self;
}
- (void)setStatus:(BOOL)isSeleted{
    if (isSeleted) {
        _iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_iconNormal]];
        _titleLab.textColor = [UIColor whiteColor];
    }else{
        _iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_iconSelected]];
        _titleLab.textColor = [UIColor lightTextColor];
    }
}

@end

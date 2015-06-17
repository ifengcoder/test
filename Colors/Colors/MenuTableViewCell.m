//
//  MenuTableViewCell.m
//  Colors
//
//  Created by Creditwe on 15/6/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "MenuTableViewCell.h"

@interface MenuTableViewCell ()

    @property(nonatomic,strong) UIImageView * logoImg;// 图标
    @property(nonatomic,strong) UILabel * logoLabel; //文字
@end
@implementation MenuTableViewCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
       
        UIImageView * img = [[UIImageView alloc]init];
        [self.contentView addSubview:img];
        self.logoImg=img;
        
        UILabel *title= [[UILabel alloc]init];
        title.font= [UIFont systemFontOfSize:15];
        [self.contentView addSubview:title];
        self.logoLabel=title;
    }
    
    return self;
}

//重写set 方法
-(void) setMenu:(MenuModel *)menu{
    _menu=menu;//记录传进来的模型
    //给子控件赋值
    [self settingData];
    //设置子控件的frame
    [self settingFrame];
    
}
//对子控件赋值
-(void) settingData{
    self.logoImg.image = [UIImage imageNamed:_menu.logo];
    self.logoLabel.text = _menu.title;
    
}
//设置子控件的frame
-(void) settingFrame{
    
    self.logoImg.frame = CGRectMake(10, 10, 40, 40);
    self.logoLabel.frame = CGRectMake(CGRectGetMaxX(self.logoImg.frame)+10, 10, ([[UIScreen mainScreen] bounds].size.width-40-20), 40);
    
}

@end

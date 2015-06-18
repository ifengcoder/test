//
//  AnimationTextField.h
//  Colors
//
//  Created by Creditwe on 15/6/18.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    AnimationFieldTypeBound,
    AnimationFieldTypeUp,
    AnimationFieldtypeShake
    
} AnimationFieldType;
@interface AnimationTextField : UIView
//输入看文字颜色
@property(strong,nonatomic) UIColor *textColor;
//占位符
@property(copy,nonatomic) NSString *placeStr;
//占位符颜色
@property(strong,nonatomic) UIColor *placeholderColor;
//占位符字体，和textField字体大小相同
@property(strong,nonatomic) UIFont *placeholderFont;
//文字到对齐方式
@property(assign,nonatomic) NSTextAlignment textAlignment;
//输入到文字内容
@property(copy,nonatomic,readonly) NSString *textInput;
//动画类型
@property(assign,nonatomic) AnimationFieldType animationType;
@end

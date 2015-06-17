//
//  UICommonModel.h
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UICommonModel : NSObject

@property(nonatomic,strong) NSString * title;//标题
@property(nonatomic,strong) NSString * date; //日期

//构造方法
-(UICommonModel *) initWithTitle:(NSString *) titleName andDate:(NSString *) dateStr;

//
+(UICommonModel *) initWithTitle:(NSString *) titleName andDate:(NSString *) dateStr;

//
@end

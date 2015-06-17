//
//  UICommonListGroup.h
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UICommonListGroup : NSObject

#pragma mark 组名
@property(nonatomic,copy) NSString *groupName;
#pragma mark 分组描述
@property(nonatomic,copy) NSString *groupDesc;
#pragma mark 列表
@property(nonatomic,strong) NSMutableArray *commonList;


#pragma mark 带参数个构造函数
-(UICommonListGroup *)initWithGroupName:(NSString *)name andDesc:(NSString *)desc andCommonList:(NSMutableArray *)commons;

#pragma mark 静态初始化方法
+(UICommonListGroup *)initWithGroupName:(NSString *)name andDesc:(NSString *)desc andCommonList:(NSMutableArray *)commons;
@end

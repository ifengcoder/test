//
//  KCContactGroup.h
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContactGroup : NSObject

#pragma mark 组名
@property(nonatomic,copy) NSString *name;
#pragma mark 分组描述
@property(nonatomic,copy) NSString *detail;
#pragma mark 联系人
@property(nonatomic,strong) NSMutableArray *contacts;
#pragma mark 带参数个构造函数
-(KCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

#pragma mark 静态初始化方法
+(KCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

@end

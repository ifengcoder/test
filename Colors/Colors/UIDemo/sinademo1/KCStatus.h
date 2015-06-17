//
//  KCStatus.h
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCStatus : NSObject
#pragma mark - 属性
@property (nonatomic,assign) long long Id;//微博id
@property (nonatomic,copy) NSString *profileImageUrl;//头像
@property (nonatomic,copy) NSString *userName;//发送用户
@property (nonatomic,copy) NSString *mbtype;//会员类型
@property (nonatomic,copy) NSString *createdAt;//创建时间
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *text;//微博内容



#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(KCStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(KCStatus *)statusWithDictionary:(NSDictionary *)dic;
@end

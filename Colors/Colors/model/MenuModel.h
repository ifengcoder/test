//
//  MenuModel.h
//  Colors
//
//  Created by Creditwe on 15/6/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuModel : NSObject

//图标
@property (nonatomic,copy) NSString * logo;
//图标描述
@property (nonatomic,copy) NSString * title;

//接口
-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) menuModelWithDict:(NSDictionary *)dict;
@end

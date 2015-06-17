


//
//  MenuModel.m
//  Colors
//
//  Created by Creditwe on 15/6/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel

-(instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //使用kvc
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//工厂方法
+(instancetype) menuModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end

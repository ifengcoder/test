
//
//  UICommonModel.m
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "UICommonModel.h"

@implementation UICommonModel

-(UICommonModel *)initWithTitle:(NSString *)titleName andDate:(NSString *)dateStr{
    if (self = [super init]) {
        self.title=titleName;
        self.date = dateStr;
    }
    return self;
}

+(UICommonModel *) initWithTitle:(NSString *)titleName andDate:(NSString *)dateStr{
    UICommonModel * common = [[UICommonModel alloc]initWithTitle:titleName andDate:dateStr];
    return common;
}
@end


//
//  UICommonListGroup.m
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "UICommonListGroup.h"

@implementation UICommonListGroup

-(UICommonListGroup *)initWithGroupName:(NSString *)name andDesc:(NSString *)desc andCommonList:(NSMutableArray *)commons{
    if (self==[self init]) {
        self.groupName=name;
        self.groupDesc=desc;
        self.commonList=commons;
    }
    return self;
}
//
+(UICommonListGroup *) initWithGroupName:(NSString *)name andDesc:(NSString *)desc andCommonList:(NSMutableArray *)commons{
    
    UICommonListGroup *group = [[UICommonListGroup alloc] initWithGroupName:name andDesc:desc andCommonList:commons];
    return group;
}
@end

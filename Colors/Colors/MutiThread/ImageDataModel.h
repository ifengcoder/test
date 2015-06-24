//
//  ImageDataModel.h
//  Colors
//  由于更新图片需要传递UIImageView的索引和图片数据，因此这里不妨定义一个类保存图片索引和图片数据以供后面使用
//  Created by pro on 15/6/22.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDataModel : NSObject

#pragma mark 索引

@property(nonatomic,assign) int index;

#pragma mark  图片数据
@property (nonatomic,strong) NSData *data;
@end

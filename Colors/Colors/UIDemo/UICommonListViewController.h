//
//  UICommonListViewController.h
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
@interface UICommonListViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property (nonatomic, retain) UINavigationController *nav;

@end

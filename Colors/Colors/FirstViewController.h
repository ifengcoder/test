//
//  FirstViewController.h
//  Colors
//
//  Created by Creditwe on 15/6/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
@interface FirstViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property (weak,nonatomic) ICSDrawerController *drawer;
@end

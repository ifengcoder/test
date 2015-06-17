//
//  RootViewController.m
//  Colors
//
//  Created by Creditwe on 15/6/16.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "RootViewController.h"
#import "ICSDrawerController.h"
#import "MenuViewController.h"
#import "ICSPlainColorViewController.h"
@interface RootViewController()
{
    ICSDrawerController        *ICSDDrawer; //

}
@end
@implementation RootViewController

-(void) viewDidLoad{
    
    [super viewDidLoad];
    
    [self loadMenu];//加载菜单
}

-(void) loadMenu{
    NSArray *colors = @[[UIColor colorWithRed:237.0f/255.0f green:195.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:237.0f/255.0f green:147.0f/255.0f blue:0.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:237.0f/255.0f green:9.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
                        ];
    
    MenuViewController *colorsVC = [[MenuViewController alloc] initWithColors:colors];
    ICSPlainColorViewController *plainColorVC = [[ICSPlainColorViewController alloc] init];
    plainColorVC.view.backgroundColor = colors[0];
    
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:colorsVC
                                                                     centerViewController:plainColorVC];
    [self.navigationController pushViewController:drawer animated:YES];
}
@end

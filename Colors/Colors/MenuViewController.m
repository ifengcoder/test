//
//  ICSColorsViewController.m
//
//  Created by Vito Modena
//
//  Copyright (c) 2014 ice cream studios s.r.l. - http://icecreamstudios.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "MenuViewController.h"
#import "ICSPlainColorViewController.h"
#import "MenuTableViewCell.h"
#import "MenuModel.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
static NSString * const kICSColorsViewControllerCellReuseId = @"kICSColorsViewControllerCellReuseId";



@interface MenuViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSArray *colors;
@property(nonatomic, assign) NSInteger previousRow;

//
@property(nonatomic,strong) NSArray * menus;
@end



@implementation MenuViewController

- (id)initWithColors:(NSArray *)colors
{
    NSParameterAssert(colors);
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _colors = colors;
    }
    return self;
}

#pragma mark - Managing the view

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kICSColorsViewControllerCellReuseId];
//    UITableView * tableList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
//    
//    tableList.dataSource=self;
//    tableList.delegate= self;
    
//    
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:kICSColorsViewControllerCellReuseId];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleDefault;
    //
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"MenuList.plist" ofType:nil];
            NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
    
             NSMutableArray *models=[NSMutableArray arrayWithCapacity:arrayM.count];
            for (NSDictionary *dict in arrayM)
            {
                MenuModel *menuObj=[MenuModel menuModelWithDict:dict];
               [models addObject:menuObj];
    }
    _menus=[models copy];
    
}

#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSParameterAssert(self.colors);
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert(self.colors);
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kICSColorsViewControllerCellReuseId
//                                                            forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"Color %ld", (long)indexPath.row];
//    cell.textLabel.textColor = [UIColor whiteColor];
//
//    cell.backgroundColor = self.colors[indexPath.row];
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kICSColorsViewControllerCellReuseId forIndexPath:indexPath];
    [cell setMenu:self.menus[indexPath.row]];//设置cell的数据
    return cell;
    
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == self.previousRow) {
//        // Close the drawer without no further actions on the center view controller
//        [self.drawer close];
//    }
//    else {
//        // Reload the current center view controller and update its background color
//        typeof(self) __weak weakSelf = self;
//        [self.drawer reloadCenterViewControllerUsingBlock:^(){
//            NSParameterAssert(weakSelf.colors);
//            weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
//        }];
//        
////        // Replace the current center view controller with a new one
////        ICSPlainColorViewController *center = [[ICSPlainColorViewController alloc] init];
////        center.view.backgroundColor = [UIColor redColor];
////        [self.drawer replaceCenterViewControllerWithViewController:center];
//    }
//    self.previousRow = indexPath.row;
    //begin
    switch (indexPath.row) {
        case 0:
        {
            FirstViewController * one = [[FirstViewController alloc] init];
            [self.drawer replaceCenterViewControllerWithViewController:one];
            break;
        }
        case 1:{
            SecondViewController * two = [[SecondViewController alloc] init];
            [self.drawer replaceCenterViewControllerWithViewController:two];
            break;
            
            break;
        }
        case 2:{
            ThirdViewController * three = [[ThirdViewController alloc] init];
            [self.drawer replaceCenterViewControllerWithViewController:three];
            break;
            break;
        }
        default:
            break;
    }
    //end
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end

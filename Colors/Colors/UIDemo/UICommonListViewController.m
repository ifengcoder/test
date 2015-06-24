//
//  UICommonListViewController.m
//  Colors
//
//  Created by Creditwe on 15/6/17.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "UICommonListViewController.h"
#import "UICommonListGroup.h"
#import "UICommonModel.h"

#import "KCMainViewController.h"
#import "KCStatusViewController.h" //sina weibo
#import "ToolBarTableViewController.h" //toolbar
#import "KCContactSearchViewController.h" //search
#import "KCContactTableViewControllerWithUISearchDisplayControler.h" //search display
#import "AnimationTextFieldControllerViewController.h"

#import "NSThreadViewController.h"
#import "NSThreadViewController1.h"
@interface UICommonListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableList;
    //数据
    NSMutableArray * commonData;
}
@end

@implementation UICommonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableList = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableList.dataSource=self;
    tableList.delegate =self;
    
    [self.view addSubview:tableList];
    [self initData];
    
}
//初始化数据
-(void) initData{
    
    commonData=[[NSMutableArray alloc]init];
    
    UICommonModel *model1=[UICommonModel initWithTitle:@"通讯录" andDate:@"2015-06-16"];
    UICommonModel *model2= [UICommonModel initWithTitle:@"sina" andDate:@"2015-06-17"];
    UICommonModel *model3= [UICommonModel initWithTitle:@"toolbar" andDate:@"2015-06-17"];
    UICommonModel *model4 =[UICommonModel initWithTitle:@"search" andDate:@"2015-06-17"];
    UICommonModel *model5 =[UICommonModel initWithTitle:@"searchDisplay" andDate:@"2015-06-17"];
    UICommonModel *model6 = [UICommonModel initWithTitle:@"animationField" andDate:@"2015-06-18"];
    UICommonModel *model7 = [UICommonModel initWithTitle:@"mutithread" andDate:@"2015-06-22"];
    UICommonModel *model8 = [UICommonModel initWithTitle:@"mutithread1" andDate:@"2015-06-22"];

    UICommonListGroup *group1 = [UICommonListGroup initWithGroupName:@"UITableView" andDesc:@"布局" andCommonList:
                                 [NSMutableArray arrayWithObjects:model1,model2,model3,model4,model5,model6,
                                  model7,model8,nil ]];
    [commonData addObject:group1];
    
}
//多少组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return commonData.count;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //每组的行数
    UICommonListGroup * group =commonData[section];
    return group.commonList.count;
    
}
-(UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UICommonListGroup *group=commonData[indexPath.section];
    UICommonModel *common=group.commonList[indexPath.row];
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    //
    //    //首先根据标识去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //如果缓存池没有到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
    cell.detailTextLabel.text = common.date;
    cell.textLabel.text =common.title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    _selectedIndexPath=indexPath;
//    KCContact *contact=group.contacts[indexPath.row];
    UICommonListGroup *group =commonData[indexPath.section];
    UICommonModel *model = group.commonList[indexPath.row];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    KCMainViewController * lianxiren  =[[KCMainViewController alloc] init];
//                    [self.nav pushViewController:lianxiren animated:YES];
                    [self.navigationController pushViewController:lianxiren animated:YES];
                    
                    break;
                }
                case 1:{
                    KCStatusViewController * sina = [[KCStatusViewController alloc] init];
                    [self.navigationController pushViewController:sina animated:YES];
                    break;
                }
                case 2:
                {
                    ToolBarTableViewController * tool = [[ToolBarTableViewController alloc] init];
                    [self.navigationController pushViewController:tool animated:YES];
                    break;
                }
                case 3:{
                    KCContactSearchViewController * sina = [[KCContactSearchViewController alloc] init];
                    [self.navigationController pushViewController:sina animated:YES];
                    break;
                }
                case 4:
                {
                    KCContactTableViewControllerWithUISearchDisplayControler * tool = [[KCContactTableViewControllerWithUISearchDisplayControler alloc] init];
                    [self.navigationController pushViewController:tool animated:YES];
                    break;
                }
                case 5:
                {
                    AnimationTextFieldControllerViewController * anima = [[AnimationTextFieldControllerViewController alloc] init];
                    [self.navigationController pushViewController:anima animated:YES];
                    break;
                }
                case 6:
                {
                    NSThreadViewController * thread = [[NSThreadViewController alloc] init];
                    [self.navigationController pushViewController:thread animated:YES];
                    break;
                }
                case 7:
                {
                    NSThreadViewController1 * thread1 = [[NSThreadViewController1 alloc] init];
                    [self.navigationController pushViewController:thread1 animated:YES];
                }
                default:
                    break;
            }
            break;
        }
            
        case 1:{
            
            switch (indexPath.row) {
                case 0:
                {
                    break;
                }
                case 1:{
                    
                    break;
                }
                case 2:
                {
                    break;
                }
                default:
                    break;
            }
            break;

        }
        case 2:{
            
            switch (indexPath.row) {
                case 0:
                {
                    break;
                }
                case 1:{
                    
                    break;
                }
                case 2:
                {
                    break;
                }
                default:
                    break;
            }
            break;

        }
        case 3:{
            
            switch (indexPath.row) {
                case 0:
                {
                    break;
                }
                case 1:{
                    
                    break;
                }
                case 2:
                {
                    break;
                }
                default:
                    break;
            }
            break;
            
        }

        default:
            break;
    }
 
}

-(CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat ) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
//返回每组头标题名称
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    UICommonListGroup * group = [UICommonListGroup new];
    
    return group.groupName;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

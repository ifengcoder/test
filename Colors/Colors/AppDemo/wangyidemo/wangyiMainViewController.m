//
//  wangyiMainViewController.m
//  Colors
//
//  Created by Creditwe on 15/6/23.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "wangyiMainViewController.h"
#import "wangyiFirstViewController.h"
#import "wangyiSecordViewController.h"
#import "wangyiThirdViewController.h"
@interface wangyiMainViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) wangyiFirstViewController *firstVC;
@property(nonatomic,strong) wangyiSecordViewController *secondVC;
@property(nonatomic,strong) wangyiThirdViewController *thirdVC;
@property(nonatomic,strong) UIViewController *currentVC;

@property(nonatomic,strong) UIScrollView * headScrollView;//顶部滚动视图
@property(nonatomic,strong) NSArray *headArray;//   数据


@end

@implementation wangyiMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"网易新闻demo";
    self.headArray =@[@"头条",@"娱乐",@"体育",@"财经",@"科技"];
    self.automaticallyAdjustsScrollViewInsets =NO;//when there is more than one scroll view in the view hierarchy
    self.headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 40)];
    self.headScrollView.backgroundColor = [UIColor purpleColor];
    self.headScrollView.contentSize =CGSizeMake(560, 0);
    self.headScrollView.bounces=NO;
    self.headScrollView.pagingEnabled =YES;
    [self.view addSubview:self.headScrollView];
    for (int i=0; i<[self.headArray count]; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame =CGRectMake(0+i*80, 0, 80, 40);
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        button.tag =i+100;
        [button addTarget:self action:@selector(didClickHeadAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headScrollView addSubview:button];
        
        /*
         苹果新的API增加了addChildViewController方法，并且希望我们在使用addSubview时，同时调用[self addChildViewController:child]方法将sub view对应的viewController也加到当前ViewController的管理中。
         对于那些当前暂时不需要显示的subview，只通过addChildViewController把subViewController加进去；需要显示时再调用transitionFromViewController方法。将其添加进入底层的ViewController中。
         这样做的好处：
         
         1.无疑，对页面中的逻辑更加分明了。相应的View对应相应的ViewController。
         2.当某个子View没有显示时，将不会被Load，减少了内存的使用。
         3.当内存紧张时，没有Load的View将被首先释放，优化了程序的内存释放机制。
         */
        
        /**
         *  在iOS5中，ViewController中新添加了下面几个方法：
         *  addChildViewController:
         *  removeFromParentViewController
         *  transitionFromViewController:toViewController:duration:options:animations:completion:
         *  willMoveToParentViewController:
         *  didMoveToParentViewController: 
         */
        self.firstVC = [[wangyiFirstViewController alloc] init];
        [self.firstVC.view setFrame:CGRectMake(0, 104, 320, 464)];
        [self addChildViewController:_firstVC];
        
        self.secondVC = [[wangyiSecordViewController alloc] init];
        [self.secondVC.view setFrame:CGRectMake(0, 104, 320, 464)];
//        [self addChildViewController:_secondVC];
        
        self.thirdVC = [[wangyiThirdViewController alloc]init];
        [self.thirdVC.view setFrame:CGRectMake(0, 104, 320, 464)];
//        [self addChildViewController:_thirdVC];
        
        //  默认,第一个视图(你会发现,全程就这一个用了addSubview)
        [self.view addSubview:self.firstVC.view];
        self.currentVC = self.firstVC;
    }
}

-(void)didClickHeadAction:(UIButton *)button
{
    //  点击处于当前页面的按钮,直接跳出
    if ((self.currentVC == self.firstVC && button.tag == 100)||(self.currentVC == self.secondVC && button.tag == 101.)) {
        return;
    }else{
        
        //  展示2个,其余一样,自行补全噢
        switch (button.tag) {
            case 100:
                [self replaceController:self.currentVC newController:self.firstVC];
                break;
            case 101:
                [self replaceController:self.currentVC newController:self.secondVC];
                break;
            case 102:
                //.......
                [self replaceController:self.currentVC newController:self.thirdVC];
                break;
            case 103:
                //.......
                break;
            case 104:
                //.......
                break;
            case 105:
                //.......
                break;
            case 106:
                //.......
                break;
                //.......
            default:
                break;
        }
    }
    
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *            着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
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

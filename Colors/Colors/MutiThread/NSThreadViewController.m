//
//  NSThreadViewController.m
//  Colors
//
//  Created by pro on 15/6/22.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()
{
    UIImageView *_imageView;// 1
    
    // 2
    NSMutableArray *_imageViews;// 多个图片
    NSMutableArray *_imageNames;// 图片名
    NSMutableArray *_threads;// 线程
    
    //
}
@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}
#pragma mark 界面布局
-(void) layoutUI{
    
//     1、
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame =CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMutiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
     
     
    //2  多个线程并发，界面中多加载几张图片，每个图片都来自远程请求
    
    
}
#pragma mark 就图片显示到界面
-(void) updateImage:(NSData *) imageData{
    
    UIImage *image = [UIImage imageWithData:imageData];
    _imageView.image = image;
}
#pragma mark 请求图片数据
-(NSData *) requestData{
    //对于多线程操作金阿姨把线程操作放到@autoreleasepool中
    @autoreleasepool {
        NSURL *url=[NSURL URLWithString:@"http://image.baidu.com/detail/newindex?col=%E5%AE%A0%E7%89%A9&tag=%E5%85%A8%E9%83%A8&pn=1&pid=9186072935&aid=&user_id=664577379&setid=-1&sort=0&newsPn=&star=&fr=&from=1"];
        NSData *data=[NSData dataWithContentsOfURL:url];
        return data;
    }
}
#pragma mark 加载图片
-(void) loadImage{
    
    //请求数据
    NSData *data= [self requestData];
    /*将数据显示到UI控件,注意只能在主线程中更新UI,
     另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     所以它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     Object：代表调用方法的参数,不过只能传递一个参数(多个参数轻定义成对象类型)
     waitUntilDone:是否线程任务完成执行
     */
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
    
}
#pragma mark 多线程下载图片
-(void) loadImageWithMutiThread{
    
    //方法1：使用对象方法
    //创建一个线程，第一个参数是请求的操作，第二个参数是线程方法执行参数
    //    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
    //    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
    //    [thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
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

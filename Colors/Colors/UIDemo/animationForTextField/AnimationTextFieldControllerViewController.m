
//
//  AnimationTextFieldControllerViewController.m
//  Colors
//
//  Created by Creditwe on 15/6/18.
//  Copyright (c) 2015年 ice cream studios s.r.l. All rights reserved.
//

#import "AnimationTextFieldControllerViewController.h"
#import "AnimationTextField.h"
@interface AnimationTextFieldControllerViewController ()

@end

@implementation AnimationTextFieldControllerViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    CGFloat TextX = 20;
    CGFloat TextY = 40;
    CGFloat TextW = self.view.frame.size.width - 40;
    CGFloat TextH = 60;
    NSArray *placeHolderArr = @[@"用户名",@"密码",@"就是这样",@"动画效果",@"我还有一点",@"继续加吧"];
    NSArray *textColorArr = @[[UIColor redColor],[UIColor purpleColor],[UIColor brownColor],[UIColor lightGrayColor],[UIColor greenColor],[UIColor yellowColor]];
    NSArray *animArr = @[@(AnimationFieldtypeShake),
                         @(AnimationFieldTypeBound),
                         @(AnimationFieldTypeUp),
                         @(AnimationFieldtypeShake),
                         @(AnimationFieldTypeBound),
                         @(AnimationFieldTypeUp)];
 
    for (int i = 0; i < 6; i++) {
        AnimationTextField *customField = [[AnimationTextField alloc]initWithFrame:CGRectMake(TextX, TextY + i*(TextH+TextX), TextW ,TextH)];
        customField.placeholderFont = [UIFont systemFontOfSize:15];
        customField.placeStr = placeHolderArr[i];//文字
        customField.placeholderColor = [self getRandomColor];//占位符颜色
        customField.textColor = textColorArr[i];// 文字颜色
        customField.animationType = (AnimationFieldType)[animArr[i] integerValue]; //动画效果
        customField.tag = i + 10;
        [self.view addSubview:customField];
    }
}

-(UIColor *)getRandomColor{
    CGFloat r = (arc4random()%255)/255.0;
    CGFloat g = (arc4random()%255)/255.0;
    CGFloat b = (arc4random()%255)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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

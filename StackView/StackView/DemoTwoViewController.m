//
//  DemoTwoViewController.m
//  StackView
//
//  Created by hjbsj on 2018/6/21.
//  Copyright © 2018年 hjb. All rights reserved.
//

#import "DemoTwoViewController.h"

@interface DemoTwoViewController ()
{
    UIStackView *stackView;
}
@end

@implementation DemoTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    stackView = [[UIStackView alloc] init];
    //布局方向
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.frame = CGRectMake(0, 100, kSCreenWidth, 280);
    [self.view addSubview:stackView];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"加一个Label" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(50, 400, 100, 50);
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeBtn setTitle:@"减一个Label" forState:UIControlStateNormal];
    [removeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    removeBtn.frame = CGRectMake(200, 400, 100, 50);
    [removeBtn addTarget:self action:@selector(removeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
    
}

- (void)addClick
{
    NSLog(@"添加之前 %lu",(unsigned long)stackView.subviews.count);
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment =  NSTextAlignmentCenter;
    NSMutableString *str = [NSMutableString stringWithFormat:@"测试"];
    for (NSInteger i = 0; i < random() % 4 ; i++) {
        [str appendString:@"测试"];
    }
    label.text = str;
    label.backgroundColor = [UIColor colorWithRed:random() % 256 / 255.0 green:random() % 256 / 255.0 blue:random() % 256 / 255.0 alpha:1.0];
    [stackView addArrangedSubview:label];
    
    [UIView animateWithDuration:1.0 animations:^{
        [self->stackView layoutIfNeeded];
    }];
    NSLog(@"添加之后 %lu",(unsigned long)stackView.subviews.count);
}

- (void)removeClick
{
    NSLog(@"删除之前 %lu",(unsigned long)stackView.subviews.count);
    
    UIView *view = stackView.subviews.lastObject;
    [stackView removeArrangedSubview:view];
    [view removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        [self->stackView layoutIfNeeded];
    }];
    NSLog(@"删除之后 %lu",(unsigned long)stackView.subviews.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

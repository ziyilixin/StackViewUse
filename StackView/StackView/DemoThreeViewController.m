//
//  DemoThreeViewController.m
//  StackView
//
//  Created by hjbsj on 2018/6/21.
//  Copyright © 2018年 hjb. All rights reserved.
//

#import "DemoThreeViewController.h"

@interface DemoThreeViewController ()
@property (nonatomic, strong) UIStackView *horizontalView;
@property (nonatomic, strong) UIStackView *verticalView;
@end

@implementation DemoThreeViewController

- (UIStackView *)horizontalView
{
    if (!_horizontalView) {
        _horizontalView = [[UIStackView alloc] init];
        _horizontalView.axis = UILayoutConstraintAxisHorizontal;
        _horizontalView.distribution = UIStackViewDistributionFillEqually;
        _horizontalView.spacing = 10;
        _horizontalView.alignment = UIStackViewAlignmentFill;
    }
    return _horizontalView;
}

- (UIStackView *)verticalView
{
    if (!_verticalView) {
        _verticalView = [[UIStackView alloc] init];
        _verticalView.axis = UILayoutConstraintAxisVertical;
        _verticalView.distribution = UIStackViewDistributionFillEqually;
        _verticalView.spacing = 10;
        _verticalView.alignment = UIStackViewAlignmentFill;
    }
    return _verticalView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.verticalView];
    
    [self.verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kNavigationBarHeight, 0, 50, 0));
    }];
    
    [self addClickEvent];
}

- (void)addClickEvent
{
    UIButton *addHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addHorizontalBtn setTitle:@"横向增加" forState:UIControlStateNormal];
    [addHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addHorizontalBtn.frame = CGRectMake(0, 350, 100, 50);
    [addHorizontalBtn addTarget:self action:@selector(addHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addHorizontalBtn];
    
    UIButton *removeHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeHorizontalBtn setTitle:@"横向减少" forState:UIControlStateNormal];
    [removeHorizontalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeHorizontalBtn.frame = CGRectMake(0, 400, 100, 50);
    [removeHorizontalBtn addTarget:self action:@selector(removeHorizontalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeHorizontalBtn];
    
    UIButton *addVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addVerticalBtn setTitle:@"竖向增加" forState:UIControlStateNormal];
    [addVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    addVerticalBtn.frame = CGRectMake(0, 450, 100, 50);
    [addVerticalBtn addTarget:self action:@selector(addVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addVerticalBtn];
    
    UIButton *removeVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeVerticalBtn setTitle:@"竖向减少" forState:UIControlStateNormal];
    [removeVerticalBtn setTitleColor:RadomColor forState:UIControlStateNormal];
    removeVerticalBtn.frame = CGRectMake(0, 500, 100, 50);
    [removeVerticalBtn addTarget:self action:@selector(removeVerticalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeVerticalBtn];
}

- (void)addHorizontalClick
{
    if (!_horizontalView) {
        [self.verticalView addArrangedSubview:self.horizontalView];
    }
    UIImageView *imageView = [self getDigimon];
    [self.horizontalView addArrangedSubview:imageView];
    [UIView animateWithDuration:1.0 animations:^{
        [self.horizontalView layoutIfNeeded];
    }];
}

- (void)removeHorizontalClick
{
    if (!_horizontalView) return;
    UIView *view = self.horizontalView.subviews.lastObject;
    if (!view) return;
    [self.horizontalView removeArrangedSubview:view];
    [view removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        [self.horizontalView layoutIfNeeded];
    }];
}

- (void)addVerticalClick
{
    UIImageView *imageView = [self getDigimon];
    [self.verticalView insertArrangedSubview:imageView atIndex:0];
    [UIView animateWithDuration:1.0 animations:^{
        [self.verticalView layoutIfNeeded];
    }];
}

- (void)removeVerticalClick
{
    if (!_verticalView) return;
    UIView *view = self.verticalView.subviews.lastObject;
    if (!view) return;
    if ([view isKindOfClass:[UIStackView class]]) {
        _horizontalView = nil;
    }
    [self.verticalView removeArrangedSubview:view];
    [view removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        [self.verticalView layoutIfNeeded];
    }];
}

- (UIImageView *)getDigimon
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *imageName = [NSString stringWithFormat:@"222_%zd.jpg",random() % 16 + 1];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

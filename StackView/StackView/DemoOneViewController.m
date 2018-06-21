//
//  DemoOneViewController.m
//  StackView
//
//  Created by hjbsj on 2018/6/21.
//  Copyright © 2018年 hjb. All rights reserved.
//

#import "DemoOneViewController.h"

@interface DemoOneViewController ()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation DemoOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, kSCreenWidth, 200)];
    /**
     typedef NS_ENUM(NSInteger, UILayoutConstraintAxis) {
     UILayoutConstraintAxisHorizontal = 0,//水平
     UILayoutConstraintAxisVertical = 1//垂直
     };
     */
    //子控件的布局方向
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    /**
     typedef NS_ENUM(NSInteger, UIStackViewDistribution) {
     UIStackViewDistributionFill = 0,
     UIStackViewDistributionFillEqually,
     UIStackViewDistributionFillProportionally,
     UIStackViewDistributionEqualSpacing,
     UIStackViewDistributionEqualCentering,
     };
     */
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    //子控件之间的最小间距
    self.stackView.spacing = 3;
    /**
     typedef NS_ENUM(NSInteger, UIStackViewAlignment) {
     UIStackViewAlignmentFill,
     UIStackViewAlignmentLeading,
     UIStackViewAlignmentTop = UIStackViewAlignmentLeading,
     UIStackViewAlignmentFirstBaseline, // Valid for horizontal axis only
     UIStackViewAlignmentCenter,
     UIStackViewAlignmentTrailing,
     UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,
     UIStackViewAlignmentLastBaseline, // Valid for horizontal axis only
     };
     */
    self.stackView.alignment = UIStackViewAlignmentFill;
    
    for (NSInteger i = 0; i < 4; i++) {
        UILabel *textLab = [[UILabel alloc] init];
        textLab.text = @"UIStackView";
        textLab.font = [UIFont systemFontOfSize:17.0];
        textLab.textColor = [UIColor blackColor];
        textLab.textAlignment = NSTextAlignmentCenter;
        textLab.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1.0];
        //添加子视图
        [self.stackView addArrangedSubview:textLab];
    }
    
    [self.view addSubview:self.stackView];
}

/**
 addArrangedSubview 添加子视图
 removeArrangedSubview 删除子视图
 insertArrangedSubview: atIndex: 根据下标插入子视图
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

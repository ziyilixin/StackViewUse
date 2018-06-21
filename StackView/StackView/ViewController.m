//
//  ViewController.m
//  StackView
//
//  Created by hjbsj on 2018/6/20.
//  Copyright © 2018年 hjb. All rights reserved.
//

#import "ViewController.h"
#import "DemoOneViewController.h"
#import "DemoTwoViewController.h"
#import "DemoThreeViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"UIStackView";
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"控件布局";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"通过Label了解StackView";
    }
    else {
        cell.textLabel.text = @"一个利用StackView布局的小Demo";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        DemoOneViewController *oneVC = [[DemoOneViewController alloc] init];
        [self.navigationController pushViewController:oneVC animated:YES];
    }
    else if (indexPath.row == 1) {
        DemoTwoViewController *twoVC = [[DemoTwoViewController alloc] init];
        [self.navigationController pushViewController:twoVC animated:YES];
    }
    else {
        DemoThreeViewController *threeVC = [[DemoThreeViewController alloc] init];
        [self.navigationController pushViewController:threeVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  CCMineViewController.m
//  CCUnreadManager_Example
//
//  Created by lucc on 2022/3/16.
//  Copyright © 2022 lucc. All rights reserved.
//

#import "CCMineViewController.h"
#import "CCUnreadService.h"
#import "CCUnreadNodeUidDefine.h"

@interface CCMineViewController ()

@end

@implementation CCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 40, 30);
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)testAction {
 
}



@end

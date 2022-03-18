//
//  CCMomentViewController.m
//  CCUnreadManager_Example
//
//  Created by lucc on 2022/3/16.
//  Copyright © 2022 lucc. All rights reserved.
//
//自定义角标测试demo

#import "CCMomentViewController.h"
#import "CCUnreadService.h"
#import "CCUnreadNodeUidDefine.h"
#import <Masonry/Masonry.h>

@interface CCMomentViewController ()<CCUnreadUpdateProtocol>
@property (nonatomic, strong) UIView *activityView;
@end

@implementation CCMomentViewController

- (void)dealloc {
    [[CCUnreadService shareInstance] removeNodeObserver:self uid:kUnreadNodeMomentSub1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 40, 30);
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectZero];
    activityView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:activityView];
    [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(100);
    }];
    //自定义角标
    activityView.customBadgeViewHandler = ^CCBadgeView *{
        CCBadgeView *badgeView = [[CCBadgeView alloc] initWithStyleConfig:CCBadgeViewConfig.new];
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:15];
        label.textColor = UIColor.whiteColor;
        label.text = @"活动中";
        [badgeView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(badgeView);
            make.width.mas_greaterThanOrEqualTo(50);
            make.height.mas_equalTo(23);
        }];
        badgeView.layer.cornerRadius = 11.5;
        return badgeView;
    };
    self.activityView = activityView;
    [[CCUnreadService shareInstance] addNodeObserver:self uid:kUnreadNodeMomentSub1];
}

- (void)testAction {
    CCBadgeType type = arc4random_uniform(2) == 1 ? CCBadgeTypeNumber : CCBadgeTypeCustom;
    [[CCUnreadService shareInstance] updateWithUid:kUnreadNodeMomentSub1 badgeType:type num:arc4random_uniform(55)];
}

#pragma mark - CCUnreadUpdateProtocol

//节点数据发生变化
- (void)unreadNodeUpdate:(CCUnreadNode *)node {
    if ([node.uid isEqualToString:kUnreadNodeMomentSub1]) {
        [self.activityView cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(CGPointMake(10, 5)) num:node.num];
    }
}


@end

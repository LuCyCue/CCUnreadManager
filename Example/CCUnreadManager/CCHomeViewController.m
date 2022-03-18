//
//  CCHomeViewController.m
//  CCUnreadManager_Example
//
//  Created by lucc on 2022/3/16.
//  Copyright © 2022 lucc. All rights reserved.
//
//节点类型关联变化测试demo
#import "CCHomeViewController.h"
#import "CCUnreadService.h"
#import "CCUnreadNodeUidDefine.h"
#import "UIView+CCBadge.h"
#import <Masonry/Masonry.h>

@interface CCHomeViewController ()<CCUnreadUpdateProtocol>
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIButton *item1;
@property (weak, nonatomic) IBOutlet UIButton *item2;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@end

@implementation CCHomeViewController

- (void)dealloc {
    [CCUnreadService removeBatchNodesObserver:self uids:@[kUnreadNodeHomeSub1, kUnreadNodeHomeSub2, kUnreadNodeHomeSub1_1, kUnreadNodeHomeSub1_2, kUnreadNodeHomeSub2_1, kUnreadNodeHomeSub2_2]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 40, 30);
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.view1.badgeViewLayoutHandler = ^(CCBadgeView *view) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-2);
            make.top.mas_equalTo(2);
        }];
    };
    self.view2.badgeViewLayoutHandler = ^(CCBadgeView *view) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-2);
            make.top.mas_equalTo(2);
        }];
    };

    [CCUnreadService addBatchNodesObserver:self uids:@[kUnreadNodeHomeSub1, kUnreadNodeHomeSub2, kUnreadNodeHomeSub1_1, kUnreadNodeHomeSub1_2, kUnreadNodeHomeSub2_1, kUnreadNodeHomeSub2_2]];
}

- (void)testAction {
    [CCUnreadService updateWithUid:kUnreadNodeHomeSub1_1 badgeType:arc4random_uniform(4) num:33];
    [CCUnreadService updateWithUid:kUnreadNodeHomeSub1_2 badgeType:arc4random_uniform(4) num:33];
    [CCUnreadService updateWithUid:kUnreadNodeHomeSub2_1 badgeType:arc4random_uniform(4) num:11];
    [CCUnreadService updateWithUid:kUnreadNodeHomeSub2_1 badgeType:arc4random_uniform(4) num:11];
}

#pragma mark - CCUnreadUpdateProtocol

- (void)unreadNodeUpdate:(CCUnreadNode *)node {
    if ([node.uid isEqualToString:kUnreadNodeHomeSub1_1]) {
        [self.item1 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(CGPointMake(45, 0)) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeHomeSub1_2]) {
        [self.item2 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(CGPointMake(45, 0)) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeHomeSub2_1]) {
        [self.lab1 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(CGPointMake(40, -5)) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeHomeSub2_2]) {
        [self.lab2 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(CGPointMake(40, -5)) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeHomeSub1]) {
        [self.view1 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeHomeSub2]) {
        [self.view2 cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new num:node.num];
    }
}

@end

//
//  CCMessageViewController.m
//  CCUnreadManager_Example
//
//  Created by lucc on 2022/3/16.
//  Copyright © 2022 lucc. All rights reserved.
//
//CCBadgeViewConfig配置demo

#import "CCMessageViewController.h"
#import "CCUnreadService.h"
#import "CCUnreadNodeUidDefine.h"

@interface CCMessageViewController ()<CCUnreadUpdateProtocol>
@property (nonatomic, copy) NSArray *dataSource;
@end

@implementation CCMessageViewController

- (void)dealloc {
    [[CCUnreadService shareInstance] removeBatchNodesObserver:self uids:@[kUnreadNodeMessageSub1,kUnreadNodeMessageSub2,kUnreadNodeMessageSub3,kUnreadNodeMessageSub4]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blueColor;
    self.dataSource = @[@"颜色", @"字体", @"布局", @"内容"];
    [self.dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = 100+idx;
        btn.frame = CGRectMake(100, 100+idx*60, 100, 40);
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.backgroundColor = UIColor.whiteColor;
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(changeConfigAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }];
    [[CCUnreadService shareInstance] addBatchNodesObserver:self uids:@[kUnreadNodeMessageSub1,kUnreadNodeMessageSub2,kUnreadNodeMessageSub3,kUnreadNodeMessageSub4]];
    
}

- (void)changeConfigAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            [[CCUnreadService shareInstance] updateWithUid:kUnreadNodeMessageSub1 badgeType:arc4random_uniform(3)+1 num:55];
            break;
        case 101: {
            CCBadgeType type = arc4random_uniform(2) == 1 ? CCBadgeTypeNumber : CCBadgeTypeNew;
            [[CCUnreadService shareInstance] updateWithUid:kUnreadNodeMessageSub2 badgeType:type num:66];
        }
            break;
        case 102:
            [[CCUnreadService shareInstance] updateWithUid:kUnreadNodeMessageSub3 badgeType:arc4random_uniform(3)+1 num:77];
            break;
        case 103:
            [[CCUnreadService shareInstance] updateWithUid:kUnreadNodeMessageSub4 badgeType:arc4random_uniform(3)+1 num:55];
            break;
            
        default:
            break;
    }
}

#pragma mark - CCUnreadUpdateProtocol

//节点数据发生变化
- (void)unreadNodeUpdate:(CCUnreadNode *)node {
    if ([node.uid isEqualToString:kUnreadNodeMessageSub1]) {
        NSArray *colors = @[UIColor.greenColor, UIColor.yellowColor, UIColor.redColor, UIColor.grayColor];
        UIView *targetView = [self.view viewWithTag:100];
        CCBadgeViewConfig *config = CCBadgeViewConfig.new
                                        .configBackgroundColor(colors[arc4random_uniform(4)])
                                        .configTextColor(colors[arc4random_uniform(4)])
                                        .configBorderColor(colors[arc4random_uniform(4)]);
        [targetView cc_updateBadgeType:node.type badgeConfig:config num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMessageSub2]) {
        UIView *targetView = [self.view viewWithTag:101];
        CCBadgeViewConfig *config = CCBadgeViewConfig.new.
                                        configNumberFont([UIFont systemFontOfSize:13]).
                                        configLetterFont([UIFont boldSystemFontOfSize:12]);
        [targetView cc_updateBadgeType:node.type badgeConfig:config num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMessageSub3]) {
        UIView *targetView = [self.view viewWithTag:102];
        CCBadgeViewConfig *config = CCBadgeViewConfig.new
                                        .configRedDotSize(CGSizeMake(15, 15))
                                        .configOrigin(CGPointMake(arc4random_uniform(100), arc4random_uniform(20)))
                                        .configTextInset(UIEdgeInsetsMake(5, 10, 10, 15));
        [targetView cc_updateBadgeType:node.type badgeConfig:config num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMessageSub4]) {
        UIView *targetView = [self.view viewWithTag:103];
        CCBadgeViewConfig *config = CCBadgeViewConfig.new
                                        .configMaxNumLen(arc4random_uniform(2) + 1)
                                        .configBorderWidth(arc4random_uniform(10));
        [targetView cc_updateBadgeType:node.type badgeConfig:config num:node.num];
    }
}


@end

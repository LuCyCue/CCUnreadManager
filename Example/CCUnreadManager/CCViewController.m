//
//  CCViewController.m
//  CCUnreadManager
//
//  Created by lucc on 03/08/2022.
//  Copyright (c) 2022 lucc. All rights reserved.
//

#import "CCViewController.h"
#import "CCUnreadService.h"
#import "CCUnreadNodeUidDefine.h"
#import "CCHomeViewController.h"
#import "CCMomentViewController.h"
#import "CCMessageViewController.h"
#import "CCMineViewController.h"
#import "UIView+CCBadge.h"

@interface CCViewController ()<CCUnreadUpdateProtocol>
@property (nonatomic, strong) UIView *homeTabItemView;
@property (nonatomic, strong) UIView *momentTabItemView;
@property (nonatomic, strong) UIView *messageTabItemView;
@property (nonatomic, strong) UIView *mineTabItemView;
@end

@implementation CCViewController

- (void)dealloc {
    //移除监听
    [[CCUnreadService shareInstance] removeNodeObserver:self uid:kUnreadNodeHome];
    [[CCUnreadService shareInstance] removeNodeObserver:self uid:kUnreadNodeMoment];
    [[CCUnreadService shareInstance] removeNodeObserver:self uid:kUnreadNodeMessage];
    [[CCUnreadService shareInstance] removeNodeObserver:self uid:kUnreadNodeMine];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.tabBar.translucent = NO;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *homeVc = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"CCHomeViewController"]];
    UINavigationController *momentVc = [[UINavigationController alloc] initWithRootViewController:CCMomentViewController.new];
    UINavigationController *messageVc = [[UINavigationController alloc] initWithRootViewController:CCMessageViewController.new];
    UINavigationController *mineVc = [[UINavigationController alloc] initWithRootViewController:CCMineViewController.new];
    self.viewControllers = @[homeVc, momentVc, messageVc, mineVc];
    NSArray *normalImgNames = @[@"icon_tab_find_normal",@"icon_tab_moment_normal",@"icon_tab_im_normal",@"icon_tab_mine_normal"];
    NSArray *selectedImgNames = @[@"icon_tab_find_selected",@"icon_tab_moment_selected",@"icon_tab_im_selected",@"icon_tab_mine_selected"];
    CGFloat itemWidth = UIScreen.mainScreen.bounds.size.width /4.0;
    self.homeTabItemView = [[UIView alloc] initWithFrame:CGRectMake(0.5 * itemWidth - 17, 0, 34, 34)];
    self.momentTabItemView = [[UIView alloc] initWithFrame:CGRectMake(1.5 * itemWidth - 17, 0, 34, 34)];
    self.messageTabItemView = [[UIView alloc] initWithFrame:CGRectMake(2.5 * itemWidth - 17, 0, 34, 34)];
    self.mineTabItemView = [[UIView alloc] initWithFrame:CGRectMake(3.5 * itemWidth - 17, 0, 34, 34)];
    NSArray *itemViews = @[self.homeTabItemView, self.momentTabItemView, self.messageTabItemView, self.mineTabItemView];
    for (int i = 0; i < self.viewControllers.count; i++) {

        UINavigationController *navCtrl = self.viewControllers[i];
        navCtrl.tabBarItem.title = @[@"首页", @"动态", @"消息", @"我的"][i];
        navCtrl.tabBarItem.image = [[UIImage imageNamed:normalImgNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [navCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor, NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
        [navCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.redColor, NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        UIView *view = itemViews[i];
        view.userInteractionEnabled = NO;
        [self.tabBar addSubview:view];
    }
    self.tabBar.barTintColor = UIColor.whiteColor;
    self.tabBar.shadowImage = UIImage.new;
    self.tabBar.backgroundImage = UIImage.new;
    self.tabBar.backgroundColor = UIColor.whiteColor;
    [[CCUnreadService shareInstance] addNodeObserver:self uid:kUnreadNodeHome];
    [[CCUnreadService shareInstance] addNodeObserver:self uid:kUnreadNodeMoment];
    [[CCUnreadService shareInstance] addNodeObserver:self uid:kUnreadNodeMessage];
    [[CCUnreadService shareInstance] addNodeObserver:self uid:kUnreadNodeMine];
}

#pragma mark - CCUnreadUpdateProtocol

//节点数据发生变化
- (void)unreadNodeUpdate:(CCUnreadNode *)node {
    CGPoint origin = CGPointMake(23, 4);
    if ([node.uid isEqualToString:kUnreadNodeHome]) {
        [self.homeTabItemView cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(origin) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMoment]) {
        [self.momentTabItemView cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(origin) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMessage]) {
        [self.messageTabItemView cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(origin) num:node.num];
    } else if ([node.uid isEqualToString:kUnreadNodeMine]) {
        [self.mineTabItemView cc_updateBadgeType:node.type badgeConfig:CCBadgeViewConfig.new.configOrigin(origin) num:node.num];
    }
}

@end

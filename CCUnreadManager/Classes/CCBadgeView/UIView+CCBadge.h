//
//  UIView+CCBadge.h
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import <UIKit/UIKit.h>
#import "CCUnreadDefine.h"
#import "CCBadgeView.h"
#import "CCBadgeViewConfig.h"

@interface UIView (CCBadge)
//未读view
@property (nonatomic, strong) CCBadgeView *badgeView;
//未读类型
@property (nonatomic, assign) CCBadgeType badgeType;
//自定义布局handler （需要在调用 cc_updateBadgeType:num: 方法前赋值）
@property (nonatomic, copy) void(^badgeViewLayoutHandler)(CCBadgeView *view);
//自定义角标
@property (nonatomic, copy) CCBadgeView *(^customBadgeViewHandler)(void);

/// 更新或者添加View上面的角标
/// @param badgeType 角标类型
/// @param badgeConfig 角标配置
/// @param num 未读数（number 类型使用）
- (void)cc_updateBadgeType:(CCBadgeType)badgeType
               badgeConfig:(CCBadgeViewConfig *)badgeConfig
                       num:(NSUInteger)num;

@end


//
//  UIView+CCBadge.m
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import "UIView+CCBadge.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

@implementation UIView (CCBadge)

/// 更新或者添加View上面的角标
/// @param badgeType 角标类型
/// @param badgeConfig 角标配置
/// @param num 未读数（number 类型使用）
- (void)cc_updateBadgeType:(CCBadgeType)badgeType
               badgeConfig:(CCBadgeViewConfig *)badgeConfig
                       num:(NSUInteger)num {
    if (self.badgeType == badgeType) {
        if (badgeType == CCBadgeTypeNumber) {
            CCBadgeNumberView *numberView = (CCBadgeNumberView *)self.badgeView;
            [numberView setNum:num];
        }
        return;
    }
    self.badgeType = badgeType;
    [self.badgeView removeFromSuperview];
    switch (badgeType) {
        case CCBadgeTypeRedDot:
            self.badgeView = [[CCBadgeRedDotView alloc] initWithStyleConfig:badgeConfig];;
            break;
        case CCBadgeTypeNumber:
            self.badgeView = [[[CCBadgeNumberView alloc] initWithStyleConfig:badgeConfig] setNum:num];
            break;
        case CCBadgeTypeNew:
            self.badgeView = [[CCBadgeNewView alloc] initWithStyleConfig:badgeConfig];
            break;
        case CCBadgeTypeCustom:
            if (!self.customBadgeViewHandler) {
                return;
            }
            self.badgeView = self.customBadgeViewHandler();
            break;
            
        default:
            self.badgeView = nil;
            return;
            break;
    }
    [self addSubview:self.badgeView];
    if (self.badgeViewLayoutHandler) {
        self.badgeViewLayoutHandler(self.badgeView);
    } else {
        [self.badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.badgeView.styleConfig.origin.x);
            make.top.mas_equalTo(self.badgeView.styleConfig.origin.y);
        }];
    }
}

#pragma mark - Setter

- (void)setBadgeType:(CCBadgeType)badgeType {
    objc_setAssociatedObject(self, _cmd, @(badgeType), OBJC_ASSOCIATION_RETAIN);
}

- (void)setBadgeView:(UIView *)badgeView {
    objc_setAssociatedObject(self, _cmd, badgeView, OBJC_ASSOCIATION_RETAIN);
}

- (void)setBadgeViewLayoutHandler:(void (^)(CCBadgeView *))badgeViewLayoutHandler {
    objc_setAssociatedObject(self, _cmd, badgeViewLayoutHandler, OBJC_ASSOCIATION_RETAIN);
}

- (void)setCustomBadgeViewHandler:(CCBadgeView *(^)(void))customBadgeViewHandler {
    objc_setAssociatedObject(self, _cmd, customBadgeViewHandler, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Getter

- (CCBadgeType)badgeType {
    NSNumber *ret = objc_getAssociatedObject(self, @selector(setBadgeType:));
    return ret.unsignedIntegerValue;
}

- (UIView *)badgeView {
    UIView *view = objc_getAssociatedObject(self, @selector(setBadgeView:));
    return view;
}

- (void (^)(CCBadgeView *))badgeViewLayoutHandler {
    id handler = objc_getAssociatedObject(self, @selector(setBadgeViewLayoutHandler:));
    return handler;
}

- (CCBadgeView *(^)(void))customBadgeViewHandler {
    id handler = objc_getAssociatedObject(self, @selector(setCustomBadgeViewHandler:));
    return handler;
}

@end

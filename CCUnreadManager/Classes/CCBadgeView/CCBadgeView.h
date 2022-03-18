//
//  CCBadgeView.h
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import <UIKit/UIKit.h>

@class CCBadgeViewConfig;

NS_ASSUME_NONNULL_BEGIN

@interface CCBadgeView : UIView

@property (nonatomic, strong) CCBadgeViewConfig *styleConfig;

- (instancetype)initWithStyleConfig:(CCBadgeViewConfig *)config;
@end

@interface CCBadgeRedDotView : CCBadgeView

@end

@interface CCBadgeNumberView : CCBadgeView
@property (nonatomic, strong) UILabel *numLabel;
//设置数量
- (instancetype)setNum:(NSUInteger)num;
@end

@interface CCBadgeNewView : CCBadgeView

@end

NS_ASSUME_NONNULL_END

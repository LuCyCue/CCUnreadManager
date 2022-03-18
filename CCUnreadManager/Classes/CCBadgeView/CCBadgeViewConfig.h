//
//  CCBadgeViewConfig.h
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCBadgeViewConfig : NSObject
//背景色
@property (nonatomic, strong) UIColor *backgroundColor;
//边框宽度
@property (nonatomic, assign) CGFloat borderWidth;
//边框颜色
@property (nonatomic, strong) UIColor *borderColor;
//红点大小（包含边距）
@property (nonatomic, assign) CGSize redDotSize;
//文本颜色
@property (nonatomic, strong) UIColor *textColor;
//文本字体 （number类型）
@property (nonatomic, strong) UIFont *numberFont;
//未读数显示最多位数
@property (nonatomic, assign) NSUInteger maxNumLen;
//文本字体 （new类型）
@property (nonatomic, strong) UIFont *letterFont;
//文本显示边距
@property (nonatomic, assign) UIEdgeInsets textInset;
//坐标
@property (nonatomic, assign) CGPoint origin;

- (CCBadgeViewConfig *(^)(UIColor *))configBackgroundColor;
- (CCBadgeViewConfig *(^)(UIColor *))configTextColor;
- (CCBadgeViewConfig *(^)(UIColor *))configBorderColor;
- (CCBadgeViewConfig *(^)(CGFloat))configBorderWidth;
- (CCBadgeViewConfig *(^)(CGSize))configRedDotSize;
- (CCBadgeViewConfig *(^)(UIFont *))configNumberFont;
- (CCBadgeViewConfig *(^)(NSUInteger))configMaxNumLen;
- (CCBadgeViewConfig *(^)(UIFont *))configLetterFont;
- (CCBadgeViewConfig *(^)(UIEdgeInsets))configTextInset;
- (CCBadgeViewConfig *(^)(CGPoint))configOrigin;


@end

NS_ASSUME_NONNULL_END

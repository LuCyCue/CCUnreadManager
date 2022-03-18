//
//  CCBadgeViewConfig.m
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import "CCBadgeViewConfig.h"

@implementation CCBadgeViewConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.redColor;
        self.textColor = UIColor.whiteColor;
        self.borderColor = UIColor.whiteColor;
        self.borderWidth = 1.f;
        self.redDotSize = CGSizeMake(6, 6);
        self.numberFont = [UIFont systemFontOfSize:9];
        self.letterFont = [UIFont boldSystemFontOfSize:7];
        self.textInset = UIEdgeInsetsMake(1, 3, 1, 3);
        self.origin = CGPointZero;
        self.maxNumLen = 2;
    }
    return self;
}

- (CCBadgeViewConfig *(^)(UIColor *))configBackgroundColor {
    return ^CCBadgeViewConfig* (UIColor *bgColor) {
        self.backgroundColor = bgColor;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(UIColor *))configTextColor {
    return ^CCBadgeViewConfig* (UIColor *textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(UIColor *))configBorderColor {
    return ^CCBadgeViewConfig* (UIColor *color) {
        self.borderColor = color;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(CGFloat))configBorderWidth {
    return ^CCBadgeViewConfig* (CGFloat width) {
        self.borderWidth = width;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(CGSize))configRedDotSize {
    return ^CCBadgeViewConfig* (CGSize size) {
        self.redDotSize = size;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(UIFont *))configNumberFont {
    return ^CCBadgeViewConfig* (UIFont *font) {
        self.numberFont = font;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(NSUInteger))configMaxNumLen {
    return ^CCBadgeViewConfig* (NSUInteger maxLen) {
        self.maxNumLen = maxLen;
        return self;
    };
}


- (CCBadgeViewConfig *(^)(UIFont *))configLetterFont {
    return ^CCBadgeViewConfig* (UIFont *font) {
        self.letterFont = font;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(UIEdgeInsets))configTextInset {
    return ^CCBadgeViewConfig* (UIEdgeInsets inset) {
        self.textInset = inset;
        return self;
    };
}

- (CCBadgeViewConfig *(^)(CGPoint))configOrigin {
    return ^CCBadgeViewConfig* (CGPoint origin) {
        self.origin = origin;
        return self;
    };
}


@end

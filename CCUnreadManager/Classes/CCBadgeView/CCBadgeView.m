//
//  CCBadgeView.m
//  CCUnreadManager
//
//  Created by lucc on 2022/3/15.
//

#import "CCBadgeView.h"
#import "CCBadgeViewConfig.h"
#import <Masonry/Masonry.h>

@implementation CCBadgeView

- (instancetype)initWithStyleConfig:(CCBadgeViewConfig *)config {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _styleConfig = config;
        self.backgroundColor = config.backgroundColor;
        self.layer.borderColor = config.borderColor.CGColor;
        self.layer.borderWidth = config.borderWidth;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end

@implementation CCBadgeRedDotView

- (instancetype)initWithStyleConfig:(CCBadgeViewConfig *)config {
    self = [super initWithStyleConfig:config];
    if (self) {
        self.layer.cornerRadius = config.redDotSize.width / 2.0;
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(config.redDotSize);
        }];
    }
    return self;
}

@end


@implementation CCBadgeNumberView

- (instancetype)initWithStyleConfig:(CCBadgeViewConfig *)config {
    self = [super initWithStyleConfig:config];
    if (self) {
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.textColor = config.textColor;
        numLabel.font = config.numberFont;
        numLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:numLabel];
        self.numLabel = numLabel;
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (instancetype)setNum:(NSUInteger)num {
    NSUInteger maxNum = pow(10, self.styleConfig.maxNumLen);
    NSString *text = @"";
    if (num < maxNum) {
        text = @(num).stringValue;
    } else {
        text = [NSString stringWithFormat:@"%lu+", maxNum-1];
    }
    self.numLabel.text = text;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize size = [text sizeWithFont:self.numLabel.font];
#pragma clang diagnostic pop
    CGFloat height = size.height + self.styleConfig.textInset.top + self.styleConfig.textInset.bottom + self.styleConfig.borderWidth * 2;
    CGFloat width = size.width + self.styleConfig.textInset.left + self.styleConfig.textInset.right + self.styleConfig.borderWidth * 2;
    if (width < height) {
        width = height;
    }
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    self.layer.cornerRadius = height/2.0;
    return self;
}

@end


@implementation CCBadgeNewView

- (instancetype)initWithStyleConfig:(CCBadgeViewConfig *)config {
    self = [super initWithStyleConfig:config];
    if (self) {
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.textColor = config.textColor;
        numLabel.font = config.letterFont;
        numLabel.text = @"New";
        numLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:numLabel];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGSize size = [@"New" sizeWithFont:numLabel.font];
#pragma clang diagnostic pop
        CGFloat height = size.height + self.styleConfig.textInset.top + self.styleConfig.textInset.bottom + self.styleConfig.borderWidth * 2;
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.mas_equalTo(size.width + self.styleConfig.textInset.left + self.styleConfig.textInset.right + + self.styleConfig.borderWidth * 2);
            make.height.mas_equalTo(height);
        }];
        self.layer.cornerRadius = height / 2;
    }
    return self;
}

@end

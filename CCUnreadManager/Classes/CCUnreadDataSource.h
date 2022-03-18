//
//  CCUnreadDataSource.h
//  Pods
//
//  Created by Lucc on 2022/3/10.
//

#import <Foundation/Foundation.h>

@class CCUnreadNode;
@class CCBadgeViewConfig;

@protocol CCUnreadDataSource <NSObject>

/// 返回配置好的root节点
+ (CCUnreadNode *)rootNode;

@end



//
//  CCUnreadUpdateProtocol.h
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#import <Foundation/Foundation.h>

@class CCUnreadNode;

NS_ASSUME_NONNULL_BEGIN

@protocol CCUnreadUpdateProtocol <NSObject>
//节点数据发生变化
- (void)unreadNodeUpdate:(CCUnreadNode *)node;
@end

NS_ASSUME_NONNULL_END

//
//  CCUnreadService.h
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#import <Foundation/Foundation.h>
#import "CCUnreadDataSource.h"
#import "CCUnreadDefine.h"
#import "CCUnreadUpdateProtocol.h"
#import "CCUnreadNode.h"
#import "UIView+CCBadge.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCUnreadService : NSObject
//数据源（配置对应的未读节点结构）
@property (nonatomic, weak) Class<CCUnreadDataSource> dataSource;

/// 启动服务
/// @param dataSource 节点数据源配置类
+ (void)startWithDataSource:(Class<CCUnreadDataSource>)dataSource;

/// 刷新节点
/// @param uid 节点id
/// @param badgeType 红点类型
/// @param num 未读数
+ (void)updateWithUid:(NSString *)uid
            badgeType:(CCBadgeType)badgeType
                  num:(NSUInteger)num;

/// 清除所有未读
+ (void)clearAllUnread;

/// 添加监听
/// @param observer 监听者
/// @param uid 节点id
+ (void)addNodeObserver:(id<CCUnreadUpdateProtocol>)observer uid:(NSString *)uid;

/// 批量添加监听业务节点
/// @param observer 监听者
/// @param uids 节点id集合
+ (void)addBatchNodesObserver:(id<CCUnreadUpdateProtocol>)observer uids:(NSArray<NSString *> *)uids;

/// 获取业务节点
+ (CCUnreadNode *)getNodeWithUid:(NSString *)uid;

/// 移除监听都
/// @param observer 监听者
/// @param uid 节点id
+ (void)removeNodeObserver:(id<CCUnreadUpdateProtocol>)observer uid:(NSString *)uid;
@end

NS_ASSUME_NONNULL_END

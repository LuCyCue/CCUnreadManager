//
//  CCUnreadService.m
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#import "CCUnreadService.h"


@interface CCUnreadService ()
@property (nonatomic, strong) CCUnreadNode *rootNode;
@end

@implementation CCUnreadService

/// 单例
+ (nonnull CCUnreadService *)shareInstance {
    static dispatch_once_t once;
    static CCUnreadService *instance;
    dispatch_once(&once, ^{
        instance = [[CCUnreadService alloc] init];
    });
    return instance;
}

/// 启动服务
/// @param dataSource 节点数据源配置类
+ (void)startWithDataSource:(Class<CCUnreadDataSource>)dataSource {
    [self shareInstance].dataSource = dataSource;
    [self shareInstance].rootNode = [dataSource rootNode];
}

/// 刷新节点
/// @param uid 节点id
/// @param badgeType 红点类型
/// @param num 未读数
+ (void)updateWithUid:(NSString *)uid
            badgeType:(CCBadgeType)badgeType
                  num:(NSUInteger)num {
    [CCUnreadNode updateWithUid:uid badgeType:badgeType num:num rootNode:[CCUnreadService shareInstance].rootNode];
    
}

/// 清除所有红点
+ (void)clearAllUnread {
    [CCUnreadService shareInstance].rootNode = [[CCUnreadService shareInstance].dataSource rootNode];
}

/// 添加监听
/// @param observer 监听者
/// @param uid 节点id
+ (void)addNodeObserver:(id<CCUnreadUpdateProtocol>)observer uid:(NSString *)uid {
    CCUnreadNode *node = [self getNodeWithUid:uid];
    [node addNodeObserver:observer];
}

/// 批量添加监听业务节点
/// @param observer 监听者
/// @param uids 节点id集合
+ (void)addBatchNodesObserver:(id<CCUnreadUpdateProtocol>)observer uids:(NSArray<NSString *> *)uids {
    [uids enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addNodeObserver:observer uid:obj];
    }];
}

/// 获取业务节点
+ (CCUnreadNode *)getNodeWithUid:(NSString *)uid {
    return [[CCUnreadService shareInstance].rootNode getNodeWithUid:uid];
}

/// 移除监听都
/// @param observer 监听者
/// @param uid 节点id
+ (void)removeNodeObserver:(id<CCUnreadUpdateProtocol>)observer uid:(NSString *)uid {
    CCUnreadNode *node = [self getNodeWithUid:uid];
    [node removeNodeObserver:observer];
}

@end

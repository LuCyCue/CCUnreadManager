//
//  CCUnreadNode.h
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#import <Foundation/Foundation.h>
#import "CCUnreadDefine.h"
#import "CCUnreadUpdateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCUnreadNode : NSObject
//节点id
@property (nonatomic, copy) NSString *uid;
//红点类型
@property (nonatomic, assign) CCBadgeType type;
//未读数（CCBadgeTypeNumber 类型）
@property (nonatomic, assign) NSUInteger num;
//子红点节点
@property (nonatomic, strong) NSMutableArray<CCUnreadNode *> *childNodes;
//父红点节点
@property (nonatomic, weak) CCUnreadNode *superNode;

/// 初始化
- (instancetype)initWithUid:(NSString *)uid;

/// 从某个节点开始获取对应业务类型的子节点
- (CCUnreadNode *)getNodeWithUid:(NSString *)uid;

/// 刷新节点
/// @param uid 节点id
/// @param badgeType 红点类型
/// @param num 未读数
/// @param rootNode root节点
+ (void)updateWithUid:(NSString *)uid
            badgeType:(CCBadgeType)badgeType
                  num:(NSUInteger)num
             rootNode:(CCUnreadNode *)rootNode;

/// 添加监听者
- (void)addNodeObserver:(id<CCUnreadUpdateProtocol>)observer;

/// 移除监听者
- (void)removeNodeObserver:(id)observer;
@end

NS_ASSUME_NONNULL_END

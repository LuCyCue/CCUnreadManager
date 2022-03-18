//
//  CCUnreadNode.m
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#import "CCUnreadNode.h"
#import "CCUnreadWeakProxy.h"

@interface CCUnreadNode ()
@property (nonatomic, strong) NSMutableSet *observers;
@end

@implementation CCUnreadNode

- (void)dealloc {
    NSLog(@"node dealloc");
}

/// 初始化
- (instancetype)initWithUid:(NSString *)uid {
    self = [super init];
    if (self) {
        _uid = uid;
    }
    return self;
}

/// 从某个节点开始获取对应业务类型的子节点
- (CCUnreadNode *)getNodeWithUid:(NSString *)uid {
    if (uid.length == 0) {
        return nil;
    }
    if ([self.uid isEqualToString:uid]) {
        return self;
    }
    CCUnreadNode *node = nil;
    for (CCUnreadNode *tmpNode in self.childNodes) {
        node = [tmpNode getNodeWithUid:uid];
        if (node) {
            break;
        }
    }
    return node;
}

/// 刷新节点
/// @param uid 节点id
/// @param badgeType 红点类型
/// @param num 未读数
/// @param rootNode root节点
+ (void)updateWithUid:(NSString *)uid
            badgeType:(CCBadgeType)badgeType
                  num:(NSUInteger)num
             rootNode:(CCUnreadNode *)rootNode {
    CCUnreadNode *node = [rootNode getNodeWithUid:uid];
    if (!node) {
        NSString *errorDesc = [NSString stringWithFormat:@"Target node is not register uid = %@",uid];
        NSAssert(NO, errorDesc);
        return;
    }
    [node updateType:badgeType num:num];
}

/// 更新节点数据
/// @param badgeType 红点类型
/// @param num 未读数
/// @discussion 会联动更新其父节点
- (void)updateType:(CCBadgeType)badgeType num:(NSUInteger)num {
    self.type = badgeType;
    self.num = num;
    [self notifyUpdate];
    if (!self.superNode) {
        return;
    }
    CCBadgeType type = CCBadgeTypeNone;
    NSUInteger superNum = 0;
    BOOL hasRedDot = NO, isNew = NO, isCustom = NO;
    for (CCUnreadNode *node in self.superNode.childNodes) {
        if (node.type == CCBadgeTypeNumber) {
            superNum += node.num;
        } else if (node.type == CCBadgeTypeRedDot) {
            hasRedDot = YES;
        } else if (node.type == CCBadgeTypeNew) {
            isNew = YES;
        } else if (node.type == CCBadgeTypeCustom) {
            isCustom = YES;
        }
    }
    if (isCustom) {
        type = CCBadgeTypeCustom;
    } else if (isNew) {
        type = CCBadgeTypeNew;
    } else if (superNum > 0) {
        type = CCBadgeTypeNumber;
    } else if (hasRedDot) {
        type = CCBadgeTypeRedDot;
    }
    [self.superNode updateType:type num:superNum];
}

/// 添加监听者
- (void)addNodeObserver:(id<CCUnreadUpdateProtocol>)observer {
    if (!observer) {
        return;
    }
    if ([self.observers containsObject:observer]) {
        return;
    }
    for (CCUnreadWeakProxy *proxy in self.observers) {
        if (proxy.target == observer) {
            return;
        }
    }
    CCUnreadWeakProxy *proxy = [CCUnreadWeakProxy proxyWithTarget:observer];
    [self.observers addObject:proxy];
}

/// 移除监听者
- (void)removeNodeObserver:(id)observer {
    if (!observer) {
        return;
    }
    [self.observers removeObject:observer];
}

/// 通知更新
- (void)notifyUpdate {
    NSMutableArray *needDelArray = [NSMutableArray array];
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj conformsToProtocol:@protocol(CCUnreadUpdateProtocol)]) {
            [obj unreadNodeUpdate:self];
        } else {
            [needDelArray addObject:obj];
        }
    }];
    [needDelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeNodeObserver:obj];
    }];
}

#pragma mark - Getter

- (NSMutableArray<CCUnreadNode *> *)childNodes {
    if (!_childNodes) {
        _childNodes = [NSMutableArray array];
    }
    return _childNodes;
}

- (NSMutableSet *)observers {
    if (!_observers) {
        _observers = [NSMutableSet set];
    }
    return _observers;
}

#pragma mark - Setter

- (void)setSuperNode:(CCUnreadNode *)superNode {
    _superNode = superNode;
    [superNode.childNodes addObject:self];
}

@end

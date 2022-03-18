//
//  CCUnreadWeakProxy.h
//  CCUnreadManager
//
//  Created by lucc on 2022/3/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCUnreadWeakProxy : NSProxy
//被代理对象
@property (nullable, nonatomic, weak, readonly) id target;
/// 初始化
- (instancetype)initWithTarget:(id)target;
/// 初始化
+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

# CCUnreadManager

[![CI Status](https://img.shields.io/travis/lucc/CCUnreadManager.svg?style=flat)](https://travis-ci.org/lucc/CCUnreadManager)
[![Version](https://img.shields.io/cocoapods/v/CCUnreadManager.svg?style=flat)](https://cocoapods.org/pods/CCUnreadManager)
[![License](https://img.shields.io/cocoapods/l/CCUnreadManager.svg?style=flat)](https://cocoapods.org/pods/CCUnreadManager)
[![Platform](https://img.shields.io/cocoapods/p/CCUnreadManager.svg?style=flat)](https://cocoapods.org/pods/CCUnreadManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CCUnreadManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CCUnreadManager'
```

## How to use
* 节点类型和优先级：
```Objc
/// 红点类型（优先级从上往下，下面的优先级大，父节点优先显示优先级大的节点）
typedef NS_ENUM(NSUInteger, CCBadgeType) {
    CCBadgeTypeNone,   //无
    CCBadgeTypeRedDot, //红点
    CCBadgeTypeNumber, //数字
    CCBadgeTypeNew,    //new
    CCBadgeTypeCustom, //自定义（这个类型需要传入自定义的view，否则无法显示）
};
```
* 配置红点数据源，红点节点主要以树形结构分布，父节点跟随子节点的变化。
节点配置需要遵循协议：CCUnreadDataSource
具体配置可参考Example中的：CCUnreadNodeConfigs

* 初始化
初始化应该在加载红点数据之前
```Objc
    /// 启动服务
/// @param dataSource 节点数据源配置类
+ (void)startWithDataSource:(Class<CCUnreadDataSource>)dataSource;
```

* 监听节点变化
内部不会强持有监听者，可以不用手动移除
```Objc
    /// 添加监听
/// @param observer 监听者
/// @param uid 节点id
+ (void)addNodeObserver:(id<CCUnreadUpdateProtocol>)observer uid:(NSString *)uid;

/// 批量添加监听业务节点
/// @param observer 监听者
/// @param uids 节点id集合
+ (void)addBatchNodesObserver:(id<CCUnreadUpdateProtocol>)observer uids:(NSArray<NSString *> *)uids;
```
监听者需要实现：CCUnreadUpdateProtocol 现行UI刷新，可以使用UIView+CCBadge 进行角标处理，
也可直接对对应在UI进行处理
```Objc
- (void)unreadNodeUpdate:(CCUnreadNode *)node {
  
}
```
## Author

lucc, lccjust123@163.com

## License

CCUnreadManager is available under the MIT license. See the LICENSE file for more info.

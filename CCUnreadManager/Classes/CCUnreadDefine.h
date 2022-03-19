//
//  CCUnreadDefine.h
//  Pods
//
//  Created by Lucc on 2022/3/8.
//

#ifndef CCUnreadDefine_h
#define CCUnreadDefine_h

/// 红点类型（优先级从上往下，下面的优先级大，父节点优先显示优先级大的节点）
typedef NS_ENUM(NSUInteger, CCBadgeType) {
    CCBadgeTypeNone,   //无
    CCBadgeTypeRedDot, //红点
    CCBadgeTypeNumber, //数字
    CCBadgeTypeNew,    //new
    CCBadgeTypeCustom, //自定义（这个类型需要传入自定义的view，否则无法显示）
};

#endif /* CCUnreadDefine_h */

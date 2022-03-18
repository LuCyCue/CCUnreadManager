#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CCBadgeView.h"
#import "CCBadgeViewConfig.h"
#import "UIView+CCBadge.h"
#import "CCUnreadDataSource.h"
#import "CCUnreadDefine.h"
#import "CCUnreadNode.h"
#import "CCUnreadService.h"
#import "CCUnreadUpdateProtocol.h"

FOUNDATION_EXPORT double CCUnreadManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char CCUnreadManagerVersionString[];


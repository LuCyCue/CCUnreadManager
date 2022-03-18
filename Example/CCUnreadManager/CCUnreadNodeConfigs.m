//
//  CCUnreadNodeConfigs.m
//  CCUnreadManager_Example
//
//  Created by lucc on 2022/3/11.
//  Copyright © 2022 lucc. All rights reserved.
//

#import "CCUnreadNodeConfigs.h"
#import "CCUnreadNode.h"
#import "CCBadgeViewConfig.h"

#pragma mark - CCUnreadDataSource

@implementation CCUnreadNodeConfigs

+ (CCUnreadNode *)rootNode {
    CCUnreadNode *rootNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeRoot];
    //home
    CCUnreadNode *homeNode = [self homeNode];
    homeNode.superNode = rootNode;
    //moment
    CCUnreadNode *momentNode = [self momentNode];
    momentNode.superNode = rootNode;
    //message
    CCUnreadNode *messageNode = [self messageNode];
    messageNode.superNode = rootNode;
    //mine
    CCUnreadNode *mineNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMine];
    mineNode.superNode = rootNode;
    //other （非同步到tab底部的节点）
    CCUnreadNode *otherNode = [self otherNode];
    otherNode.superNode = rootNode;
    return rootNode;
}

+ (CCUnreadNode *)homeNode {
    CCUnreadNode *homeNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHome];
    
    CCUnreadNode *node1 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub1];
    node1.superNode = homeNode;
    CCUnreadNode *node1_1 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub1_1];
    node1_1.superNode = node1;
    CCUnreadNode *node1_2 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub1_2];
    node1_2.superNode = node1;
    
    CCUnreadNode *node2 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub2];
    node2.superNode = homeNode;
    CCUnreadNode *node2_1 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub2_1];
    node2_1.superNode = node2;
    CCUnreadNode *node2_2 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeHomeSub2_2];
    node2_2.superNode = node2;
    
    return homeNode;
}

+ (CCUnreadNode *)momentNode {
    CCUnreadNode *momentNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMoment];
    
    CCUnreadNode *node1 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMomentSub1];
    node1.superNode = momentNode;
    return momentNode;
}

+ (CCUnreadNode *)messageNode {
    CCUnreadNode *messageNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMessage];
    
    CCUnreadNode *node1 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMessageSub1];
    node1.superNode = messageNode;
    CCUnreadNode *node2 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMessageSub2];
    node2.superNode = messageNode;
    CCUnreadNode *node3 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMessageSub3];
    node3.superNode = messageNode;
    CCUnreadNode *node4 = [[CCUnreadNode alloc] initWithUid:kUnreadNodeMessageSub4];
    node4.superNode = messageNode;
    return messageNode;
}

+ (CCUnreadNode *)otherNode {
    CCUnreadNode *otherNode = [[CCUnreadNode alloc] initWithUid:kUnreadNodeOther];
    return otherNode;
}


@end

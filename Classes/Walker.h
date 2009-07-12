//
//  Walker.h
//  musichackday
//
//  Created by Matt Biddulph on 12/07/2009.
//  Copyright 2009 Hackdiary Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentAwareNode.h"
#import "cocos2d.h"

@interface Walker : AtlasSprite <SegmentAwareNode> {
    AtlasSpriteManager *manager;
}

@property (nonatomic, retain) AtlasSpriteManager *manager;

- (void) updateSegmentInfo: (ENSegment *) info;
@end

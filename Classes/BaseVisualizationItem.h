//
//  BaseVisualizationItem.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TrackSegmentInfo.h"
#import "SegmentAwareNode.h"
@interface BaseVisualizationItem : CocosNode <SegmentAwareNode> {

}

- (void) updateSegmentInfo: (ENSegment *) info;
@end

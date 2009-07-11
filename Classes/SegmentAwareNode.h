//
//  SegmentAwareNode.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "ENTrack.h"


@protocol SegmentAwareNode
- (void) updateSegmentInfo: (ENSegment *) info;

@end

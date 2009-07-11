//
//  TrackSegmentInfo.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENTrack.h"

@interface TrackSegmentInfo : NSObject {
	NSArray *segmentInfo;
}

- (id) initWithArray: (NSArray *) segments;

-(ENSegment *)getSementForMillisecond: (float) millisecond;

@end

//
//  TrackSegmentInfo.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TrackSegmentInfo.h"


@implementation TrackSegmentInfo

- (ENSegment *) getSementForMillisecond: (float) millisecond{
	return nil;
}

- (void) dealloc {
	[segmentInfo release];
	[super dealloc];
}


- (id) initWithArray: (NSArray *) segments{
	self = [super init];
	if (self != nil) {
		segmentInfo = [segments retain];
	}
	return self;
}

@end

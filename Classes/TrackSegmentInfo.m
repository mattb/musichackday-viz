//
//  TrackSegmentInfo.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TrackSegmentInfo.h"

@interface TrackSegmentInfo(Private)
-(ENSegment *) currentSegment;
-(BOOL) hasMoreValues;
@end


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
		currentIndex = 0;
		totalSegments = [segments count];
	}
	return self;
}


- (ENSegment *) segmentForMillisecond: (float) millisecond{
	ENSegment *currentSegment = [self currentSegment];
	if ( currentSegment )	{
		if ( currentSegment.startTime <= millisecond){
			currentIndex++;
			return currentSegment;
		} else if (currentSegment.startTime > millisecond) {
			return nil;
		} else {
			while (!currentSegment || currentSegment && currentSegment.startTime < millisecond) {
				currentIndex++;
				currentSegment = [self currentSegment];
			}
		}
	}
	return currentSegment;
}

-(ENSegment *) currentSegment{
	if ( ![self hasMoreValues]){
		return nil;
	}
	return [segmentInfo objectAtIndex:currentIndex];
}

-(BOOL) hasMoreValues{
	return totalSegments > currentIndex;
}




@end

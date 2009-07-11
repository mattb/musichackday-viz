//
//  FireBall.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FireBall.h"
#import "TrackSegmentInfo.h"
#import "ENTrack.h"

@implementation FireBall
@synthesize emitter;

- (void) dealloc {
	[emitter release];
	[super dealloc];
}

- (id) init {
	self = [super init];
	if (self != nil) {
		self.emitter = [ParticleFlower node];
        emitter.texture = [[TextureMgr sharedTextureMgr] addImage: @"fire.pvr"];
        emitter.life = 1;
		[self addChild:self.emitter];
	}
	return self;
}

- (void) updateSegmentInfo:(ENSegment *)info{
	emitter.endSize = -info.maxLoudness.loudness;
//	emitter.life = -info.globalLoudness.loudness;

}
@end

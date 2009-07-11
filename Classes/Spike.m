//
//  FireBall.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Spike.h"
#import "TrackSegmentInfo.h"
#import "ENTrack.h"

@implementation Spike
@synthesize emitter;

- (void) dealloc {
	[emitter release];
	[super dealloc];
}

- (id) init {
	self = [super init];
	if (self != nil) {
		self.emitter = [ParticleSun node];
        emitter.texture = [[TextureMgr sharedTextureMgr] addImage: @"fire.pvr"];
        emitter.life = 1;
	}
	return self;
}

- (void) updateSegmentInfo:(ENSegment *)info{
	//[self addChild:[self.emitter init]];
	[self.emitter init];
	//emitter.endSize = emitter.endSize == 1 ? -info.maxLoudness.loudness : 1;
	//	emitter.life = -info.globalLoudness.loudness;
	
}
@end

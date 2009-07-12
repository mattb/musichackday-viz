//
//  BasicEQ.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BasicEQ.h"

@interface BasicEQ(Private)
- (void) drawrectAt:(float)x withHeight:(float) height;
@end

@implementation BasicEQ
- (void) dealloc {
	[loudnessLabel release];
	[globalLoudnessLabel release];
	 
	[super dealloc];
}

	- (id) init {
		self = [super init];
		if (self != nil) {
			//[self setTransformAnchor:ccp(0,0)];
			loudnessLabel = [[Label labelWithString:@"" fontName:@"Arial" fontSize:10] retain];
			loudnessLabel.position = ccp(0,-12);
			
			globalLoudnessLabel = [[Label labelWithString:@"" fontName:@"Arial" fontSize:10] retain];
			globalLoudnessLabel.position = ccp(0,-24);

		}
		return self;
	}
- (void) draw{
	[self drawrectAt:0 withHeight:loudness];
	[self drawrectAt:20 withHeight:maxLoudness];
	
}

- (void) drawrectAt:(float)x withHeight:(float) height{
	CGPoint vertices[4];
	vertices[0] = ccp(x, 0);
	vertices[1] = ccp(x +20, 0);
	vertices[2] = ccp(x +20, height);
	vertices[3] = ccp(x, height);
	drawPoly(vertices, 4, YES);
}

- (void) updateSegmentInfo:(ENSegment *)info{
	loudness =  -info.globalLoudness.loudness;
	maxLoudness =  -info.maxLoudness.loudness;
	[globalLoudnessLabel setString:info.maxLoudness.type];
	[loudnessLabel setString:info.maxLoudness.type];
}

@end

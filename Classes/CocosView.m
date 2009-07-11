//
//  CocoView.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CocosView.h"


@implementation CocosView
@synthesize fireBall,spike;

- (void) dealloc {
	[fireBall release];
	[super dealloc];
}

- (id) init {
	self = [super init];
	if (self != nil) {
		self.fireBall = [[FireBall alloc]init];
		self.fireBall.position = ccp(100,100);
		[self addChild: self.fireBall];
		self.spike = [[Spike alloc]init];
		self.spike.position = ccp(0,0);
		[self addChild: self.spike];
		
	}
	return self;
}


- (void) updateSegmentInfo: (ENSegment *) info{
	//update fireball intensity, etc with segment info
	[self.fireBall updateSegmentInfo: info];
	[self.spike updateSegmentInfo: info];

}

@end

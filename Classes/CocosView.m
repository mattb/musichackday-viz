//
//  CocoView.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CocosView.h"
@interface CocosView(Private)
-(void) addVisualItems;
@end

@implementation CocosView
@synthesize fireBall,spike;

- (void) dealloc {
	[fireBall release];
	[super dealloc];
}

- (id) init {
	self = [super init];
	if (self != nil) {
		[self addVisualItems];
		
	}
	return self;
}

//Todo, could change the track contents on the analysis here..
-(void) addVisualItems{
	self.fireBall = [[FireBall alloc]init];
	self.fireBall.position = ccp(100,100);
	[self addChild: self.fireBall];
	self.spike = [[Spike alloc]init];
	self.spike.position = ccp(0,0);
	[self addChild: self.spike];
}

- (void) updateSegmentInfo: (ENSegment *) info{
	//update fireball intensity, etc with segment info
	for( <SegmentAwareNode> node in children){
		[node updateSegmentInfo:info];
	}
}

@end

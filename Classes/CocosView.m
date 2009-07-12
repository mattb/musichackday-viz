//
//  CocoView.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CocosView.h"
#import "BasicEQ.h"

@interface CocosView(Private)
-(void) addVisualItems;
@end

@implementation CocosView
@synthesize fireBall,spike, eq;

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
	
	self.eq = [[BasicEQ alloc] init] ;
	self.eq.position = ccp(50,50);
	[self addChild: self.eq];
}

- (void) updateSegmentInfo: (ENSegment *) info{
	//update fireball intensity, etc with segment info
	for( <SegmentAwareNode> node in children){
		[node updateSegmentInfo:info];
	}
}

@end

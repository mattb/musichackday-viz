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
@synthesize fireBall, fireBall2, spike, eq1, eq2, eq3, eq4, walker;

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
	self.fireBall.emitter.position = ccp(70,350);
	[self addChild: self.fireBall];
    
    self.fireBall2 = [[FireBall alloc]init];
	self.fireBall2.emitter.position = ccp(270,350);
	[self addChild: self.fireBall2];
    
	//self.spike = [[Spike alloc]init];
	//self.spike.position = ccp(0,0);
	//[self addChild: self.spike];
	
	self.eq1 = [[BasicEQ alloc] init] ;
	self.eq1.position = ccp(50,50);
	[self addChild: self.eq1];
    self.eq2 = [[BasicEQ alloc] init] ;
	self.eq2.position = ccp(50,250);
	[self addChild: self.eq2];

    self.eq3 = [[BasicEQ alloc] init] ;
	self.eq3.position = ccp(250,50);
	[self addChild: self.eq3];

    self.eq3 = [[BasicEQ alloc] init] ;
	self.eq3.position = ccp(250,250);
	[self addChild: self.eq3];    
    
    self.walker = [Walker node];
    self.walker.position = ccp(0,100);
	[self addChild: self.walker.manager];
    
    [self schedule: @selector(tick:) interval:1.0/60];
}

-(void) tick: (ccTime) dt
{
    int newX = self.walker.position.x + (dt * 100);
    self.walker.position = ccp(newX % 350, self.walker.position.y);
}

- (void) updateSegmentInfo: (ENSegment *) info{
	//update fireball intensity, etc with segment info
	for( <SegmentAwareNode> node in children){
        if(node != self.walker.manager) {
            [node updateSegmentInfo:info];
        }
	}
    [self.walker updateSegmentInfo:info];
}

@end

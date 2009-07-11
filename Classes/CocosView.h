//
//  CocoView.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENTrack.h"
#import "FireBall.h"
#import "Spike.h"
#import "SegmentAwareNode.h"
@interface CocosView : CocosNode <SegmentAwareNode> {
	//TODO - add more visualizations
	FireBall *fireBall;
	Spike *spike;
}

@property(retain, nonatomic) FireBall *fireBall;
@property(retain, nonatomic) Spike *spike;


- (void) updateSegmentInfo: (ENSegment *) info;

@end

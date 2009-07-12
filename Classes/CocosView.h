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
#import "BasicEQ.h"
#import "Walker.h"

@interface CocosView : CocosNode <SegmentAwareNode> {
	//TODO - add more visualizations
	FireBall *fireBall, *fireBall2;
	BasicEQ *eq1, *eq2, *eq3, *eq4;
	Spike *spike;
    Walker *walker;
}

@property(retain, nonatomic) FireBall *fireBall, *fireBall2;
@property(retain, nonatomic) Spike *spike;
@property(retain, nonatomic) BasicEQ *eq1, *eq2, *eq3, *eq4;
@property(retain, nonatomic) Walker *walker;

- (void) updateSegmentInfo: (ENSegment *) info;

@end

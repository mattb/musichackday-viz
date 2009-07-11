//
//  FireBall.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseVisualizationItem.h"
#import "cocos2d.h"

@interface Spike : BaseVisualizationItem {
	ParticleSystem *emitter;
}

@property(retain, nonatomic) ParticleSystem *emitter;

@end

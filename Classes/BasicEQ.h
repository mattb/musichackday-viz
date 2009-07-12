//
//  BasicEQ.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseVisualizationItem.h"

@interface BasicEQ : BaseVisualizationItem {
	float loudness;
	float maxLoudness;
	Label *loudnessLabel;
	Label *globalLoudnessLabel;
}

@end

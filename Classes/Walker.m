//
//  Walker.m
//  musichackday
//
//  Created by Matt Biddulph on 12/07/2009.
//  Copyright 2009 Hackdiary Ltd. All rights reserved.
//

#import "Walker.h"


@implementation Walker
@synthesize manager;

- init {
    self = [super init];
    if (self != nil) {
    }
    return self;
}

- (void) updateSegmentInfo: (ENSegment *) info{
    float loudness =  -info.globalLoudness.loudness;
    self.position = ccp(self.position.x, 100 + (3*(int)loudness));
}

+(id) node {
    AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"small-fry.png"];
    [mgr.texture setAliasTexParameters];

    Walker *walker = [Walker spriteWithRect:CGRectZero spriteManager:mgr];
    walker.manager = mgr;

    [mgr addChild: walker];
    AtlasAnimation *right = [[AtlasAnimation animationWithName:@"right" delay:0.15] retain];
    for(int i = 0; i<4; i++) {
        [right addFrameWithRect:CGRectMake(39+(i*33),112,32,32)];
    }     
    [walker runAction:[RepeatForever actionWithAction:[Animate actionWithAnimation:right]]];

    walker.scale = 2;
    
    return walker;
}
@end

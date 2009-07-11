//
//  AnalyzingViewController.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "EchoNest.h"

@interface AnalyzingViewController : UIViewController
{
    IBOutlet UILabel *status;
    EchoNest *_echoNest;
    ENTrack *_track;
    NSArray *_segments;
    int _segment_idx;
    NSString *url;
    NSString *filename;
}

@property (nonatomic, retain) EchoNest *_echoNest;
@property (nonatomic, retain) NSArray *_segments;
@property (nonatomic, retain) ENTrack *_track;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *filename;

@end
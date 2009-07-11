//
//  AnalyzingViewController.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AnalyzingViewController.h"


@implementation AnalyzingViewController
@synthesize _echoNest, _segments, _track;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
	
    self.title = @"Analyzin...";
	
	return self;
}

- (void)viewDidLoad{
	//TODO - add code to move to next view when analyzed
    NSString *APIKey = [NSString stringWithString:@"BPUEM3CGXP8KASYEL"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENKeyValidated:) name:@"ENApiKeyIsValid" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackUploadFinished:) name:@"ENTrackUploadFinished" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackTempoLoaded:) name:@"ENTrackTempoLoaded" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackUploadValidationFinished:) name:@"ENUploadValidationFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackSegmentsLoaded:) name:@"ENTrackSegmentsLoaded" object:nil];
    
    self._echoNest = [[EchoNest alloc] initWithAPIKey:APIKey];        
}


-(void)ENKeyValidated:(NSNotification*)not {
    if ([[not object] boolValue]) {
        status.text = @"Key valid.";
        [self._echoNest uploadFile:[[NSBundle mainBundle] pathForResource:@"narrier" ofType:@"mp3"]];
	} else {
        status.text = @"Invalid key";
    }
}

-(void)ENTrackUploadFinished:(NSNotification*)not {
	if ([[not object] boolValue]) {		
        status.text = @"Track upload finished, analysing...";
        _track = [_echoNest track];
        [_track getSegments];
        [_track getTempo];
    }
}

-(void)ENTrackUploadValidationFinished:(NSNotification*)not {
	// Sent if the file's MD5 hash was found on the
	// EchoNest server. Basically the same thing as 
	// ENTrackUploadFinished if the file was already
	// analyzed at some time.
	if ([[not object] boolValue]) {	
        status.text = @"Track upload validated, analysing...";
        _track = [_echoNest track];
        [_track getSegments];
        [_track getTempo];
	}
}

-(void)ENTrackTempoLoaded:(NSNotification*)not {
	if ([[[not userInfo] valueForKey:@"success"] boolValue]) {
		status.text = [NSString stringWithFormat:@"Tempo analysed: %f BPM",[[not object] tempo]];
	} else {
        status.text = @"Tempo analysis failed.";
    }
}

-(void)ENTrackSegmentsLoaded:(NSNotification*)not {
	if ([[[not userInfo] valueForKey:@"success"] boolValue]) {
        status.text = @"Track segments analysed.";
        self._segments = [not object];
        _segment_idx = 0;
        [NSTimer scheduledTimerWithTimeInterval:1/100 target:self selector:@selector(tick) userInfo:nil repeats:TRUE];
    }
}

@end

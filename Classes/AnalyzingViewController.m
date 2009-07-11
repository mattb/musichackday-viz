//
//  AnalyzingViewController.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AnalyzingViewController.h"
#import "TrackSegmentInfo.h"
#import "RootViewController.h"
#import "GTMHTTPFetcher.h"

@implementation AnalyzingViewController
@synthesize _echoNest, _segments, _track, url, filename;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
	
    self.title = @"Analyzing...";
	
	return self;
}

- (void)viewDidLoad{
	//TODO - add code to move to next view when analyzed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENKeyValidated:) name:@"ENApiKeyIsValid" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackUploadFinished:) name:@"ENTrackUploadFinished" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackTempoLoaded:) name:@"ENTrackTempoLoaded" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackUploadValidationFinished:) name:@"ENUploadValidationFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ENTrackSegmentsLoaded:) name:@"ENTrackSegmentsLoaded" object:nil];
        
    NSLog(@"%@", self.url);
    status.text = @"Downloading MP3...";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    GTMHTTPFetcher* myFetcher = [GTMHTTPFetcher httpFetcherWithRequest:request];
    [myFetcher beginFetchWithDelegate:self
                didFinishSelector:@selector(myFetcher:finishedWithData:)
                  didFailSelector:@selector(myFetcher:failedWithError:)];
}

- (void)myFetcher:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)data {
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentFolderPath = [searchPaths objectAtIndex: 0]; 
    self.filename = [documentFolderPath stringByAppendingPathComponent: @"file.mp3"];
    [[NSFileManager defaultManager] createFileAtPath:self.filename contents:data attributes:nil];
    NSLog(@"%@", self.filename);

    NSString *APIKey = [NSString stringWithString:@"BPUEM3CGXP8KASYEL"];
    self._echoNest = [[EchoNest alloc] initWithAPIKey:APIKey];   
}

- (void)myFetcher:(GTMHTTPFetcher *)fetcher failedWithError:(NSError *)error {
	NSLog(@"ERROR: %@", error);
}

-(void)ENKeyValidated:(NSNotification*)not {
    if ([[not object] boolValue]) {
        status.text = @"Key valid, uploading file.";
        // [self._echoNest uploadFile:[[NSBundle mainBundle] pathForResource:@"narrier" ofType:@"mp3"]];
        [self._echoNest uploadFile:self.filename];
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

        TrackSegmentInfo *info = [[TrackSegmentInfo alloc] initWithArray:self._segments andFileName:self.filename];
		[[NSNotificationCenter defaultCenter]
				postNotificationName:@"startVisualization" object:info];
    }
}


@end

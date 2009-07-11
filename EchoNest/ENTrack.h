//
//  ENTrack.h
//  EchoNest
//
//  Created by Kamel Makhloufi on 17/06/09.
//  Copyright 2009 melka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENBar : NSObject {	
	float confidence;
	float time;
}
@property float confidence;
@property float time;
@end

@interface ENBeat : ENBar {
}
@end

@interface ENDuration : NSObject {
	float time;
}
@property float time;
@end

@interface ENEndOfFadeIn : ENDuration {
}
@end

@interface ENStartOfFadeOut : ENDuration {
}
@end

@interface ENKey : NSObject {
	float confidence;
	int key;
}
@property float confidence;
@property int key;
@end

@interface ENLoudness : NSObject {
	float loudness;
}
@property float loudness;
@end

@interface ENSegmentLoudness : ENLoudness {
	float startTime;
	NSString* type;
}
@property float startTime;
@property (nonatomic,retain) NSString* type;
@end

@interface ENMetadata : NSObject {
	NSString*	status;
	NSString*	artist;
	NSString*	album;
	NSString*	title;
	float			duration;
	float			samplerate;
	float			bitrate;
}
@property (nonatomic,retain) NSString* status;
@property (nonatomic,retain) NSString* artist;
@property (nonatomic,retain) NSString* album;
@property (nonatomic,retain) NSString* title;
@property float duration;
@property float samplerate;
@property float bitrate;
@end

@interface ENMode : NSObject {
	float confidence;
	int	mode;
}
@property float confidence;
@property int mode;
@end

@interface ENSection : NSObject {
	float startTime;
	float time;
}
@property float startTime;
@property float time;
@end

@interface ENSegment : ENSection {
	NSArray*					pitches;
	NSArray*					timbre;
	ENSegmentLoudness*	globalLoudness;
	ENSegmentLoudness*	maxLoudness;
}
@property (nonatomic,retain) ENSegmentLoudness* globalLoudness;
@property (nonatomic,retain) ENSegmentLoudness* maxLoudness;
@property (nonatomic,retain) NSArray*				pitches;
@property (nonatomic,retain) NSArray*				timbre;
@end

@interface ENTatum : ENBar {
}
@end

@interface ENTempo : NSObject {
	float confidence;
	float tempo;
}
@property float confidence;
@property float tempo;
@end

@interface ENTimeSignature : NSObject {
	float confidence;
	float signature;
}
@property float confidence;
@property float signature;
@end


@interface ENTrack : NSObject {
	// URL LOADING
	NSURLConnection*	trackBarsConnection;
	NSMutableData*		trackBarsData;
	NSMutableArray*	trackBars;
	ENBar*				currentBar;
	
	NSURLConnection*	trackBeatsConnection;
	NSMutableData*		trackBeatsData;
	NSMutableArray*	trackBeats;
	ENBeat*				currentBeat;
	
	NSURLConnection*	trackDurationConnection;
	NSMutableData*		trackDurationData;
	ENDuration*			trackDuration;
	
	NSURLConnection*	trackEndOfFadeInConnection;
	NSMutableData*		trackEndOfFadeInData;
	ENEndOfFadeIn*		trackEndOfFadeIn;
	
	NSURLConnection*	trackKeyConnection;
	NSMutableData*		trackKeyData;
	ENKey*				trackKey;
	
	NSURLConnection*	trackLoudnessConnection;
	NSMutableData*		trackLoudnessData;
	ENLoudness*			trackLoudness;
	
	NSURLConnection*	trackMetadataConnection;
	NSMutableData*		trackMetadataData;
	ENMetadata*			trackMetadata;
	
	NSURLConnection*	trackModeConnection;
	NSMutableData*		trackModeData;
	ENMode*				trackMode;
	
	NSURLConnection*	trackSectionsConnection;
	NSMutableData*		trackSectionsData;
	NSMutableArray*	trackSections;
	ENSection*			currentSection;
	
	NSURLConnection*	trackSegmentsConnection;
	NSMutableData*		trackSegmentsData;
	NSMutableArray*	trackSegments;
	NSMutableArray*	pitches;
	NSMutableArray*	timbre;
	NSString*			currentLoudnessType;
	ENSegmentLoudness* currentSegmentMaxLoudness;
	ENSegmentLoudness* currentSegmentLoudness;
	ENSegment*			currentSegment;
	
	NSURLConnection*	trackStartOfFadeOutConnection;
	NSMutableData*		trackStartOfFadeOutData;
	ENStartOfFadeOut*	trackStartOfFadeOut;
	
	NSURLConnection*	trackTatumsConnection;
	NSMutableData*		trackTatumsData;
	NSMutableArray*	trackTatums;
	ENTatum*				currentTatum;
	
	NSURLConnection*	trackTempoConnection;
	NSMutableData*		trackTempoData;
	ENTempo*				trackTempo;
	
	NSURLConnection*	trackTimeSignatureConnection;
	NSMutableData*		trackTimeSignatureData;
	ENTimeSignature*	trackTimeSignature;
	
	NSMutableURLRequest* req;
	
	NSXMLParser*		xmlParser;
	NSMutableString*	currentStringValue;
	NSString*			notificationName;
	NSDictionary*		success;
	
	// EchoNest URL Parameters
	NSString* baseUrl;	// http://developer.echonest.com/api/;
	NSString* apiKey;		// Your API Key
	NSString* trackMD5;	// A Track MD5 if known.
}

@property (nonatomic, retain) NSString*	apiKey;
@property (nonatomic, retain) NSString*	trackMD5;
@property (nonatomic, retain) NSString*	baseUrl;

-(id) initWithApiKey:(NSString*)apikey andTrackMD5:(NSString*)trackMd5;

-(void) getBars;
-(void) getBeats;
-(void) getDuration;
-(void) getEndOfFadeIn;
-(void) getKey;
-(void) getLoudness;
-(void) getMetadata;
-(void) getMode;
-(void) getSections;
-(void) getSegments;
-(void) getStartOfFadeOut;
-(void) getTatums;
-(void) getTempo;
-(void) getTimeSignature;

@end

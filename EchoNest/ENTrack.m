//
//  ENTrack.m
//  EchoNest
//
//  Created by Kamel Makhloufi on 17/06/09.
//  Copyright 2009 melka. All rights reserved.
//

#import "ENTrack.h"

@implementation ENBar
@synthesize time;
@synthesize confidence;
@end

@implementation ENBeat
@end

@implementation ENDuration
@synthesize time;
@end

@implementation ENEndOfFadeIn
@end

@implementation ENStartOfFadeOut
@end

@implementation ENKey
@synthesize confidence;
@synthesize key;
@end

@implementation ENLoudness
@synthesize loudness;
@end

@implementation ENSegmentLoudness
@synthesize startTime;
@synthesize type;
@end

@implementation ENMetadata
@synthesize status;
@synthesize artist;
@synthesize album;
@synthesize title;
@synthesize duration;
@synthesize samplerate;
@synthesize bitrate;
@end

@implementation ENMode
@synthesize confidence;
@synthesize mode;
@end

@implementation ENSection
@synthesize startTime;
@synthesize time;
@end

@implementation ENSegment
@synthesize globalLoudness;
@synthesize maxLoudness;
@synthesize pitches;
@synthesize timbre;
@end

@implementation ENTatum
@end

@implementation ENTempo
@synthesize confidence;
@synthesize tempo;
@end

@implementation ENTimeSignature
@synthesize confidence;
@synthesize signature;
@end


@implementation ENTrack

@synthesize apiKey;
@synthesize trackMD5;
@synthesize baseUrl;

- (id) initWithApiKey:(NSString*)apikey andTrackMD5:(NSString*)trackMd5 {
	self = [super init];
	if (self != nil) {
		xmlParser = [[NSXMLParser alloc] init];
		[xmlParser setDelegate:self];
		[self setBaseUrl:@"http://developer.echonest.com/api/"];
		[self setApiKey:apikey];
		[self setTrackMD5:trackMd5];
		NSLog(@"%@",trackMd5);
		req = [[NSMutableURLRequest alloc] init];
		[req setHTTPMethod:@"GET"];
		[req setValue:@"EchoNestCocoaFramework/Alpha1" forHTTPHeaderField:@"User-Agent"];
	}
	return self;
}

-(void) getBars {
	trackBarsData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_bars?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackBarsConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getBeats {
	trackBeatsData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_beats?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackBeatsConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getDuration {
	trackDurationData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_duration?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackDurationConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getEndOfFadeIn {
	trackEndOfFadeInData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_end_of_fade_in?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackEndOfFadeInConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getKey {
	trackKeyData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_key?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackKeyConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getLoudness {
	trackLoudnessData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_loudness?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackLoudnessConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getMetadata {
	trackMetadataData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_metadata?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackMetadataConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getMode {
	trackModeData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_mode?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackModeConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getSections {
	trackSectionsData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_sections?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackSectionsConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getSegments {
	trackSegmentsData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_segments?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackSegmentsConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getStartOfFadeOut {
	trackStartOfFadeOutData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_start_of_fade_out?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackStartOfFadeOutConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getTatums {
	trackTatumsData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_tatums?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackTatumsConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getTempo {
	trackTempoData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_tempo?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackTempoConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void) getTimeSignature {
	trackTimeSignatureData = [[NSMutableData alloc] init];
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@get_time_signature?api_key=%@&md5=%@&version=3",[self baseUrl],[self apiKey], [self trackMD5]]];
	[req setURL:url];
	trackTimeSignatureConnection = [NSURLConnection connectionWithRequest:req delegate:self];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response{
	
}
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	if ([connection isEqual:trackBarsConnection]) {
		[trackBarsData appendData:data];
	}
	if ([connection isEqual:trackBeatsConnection]) {
		[trackBeatsData appendData:data];
	}
	if ([connection isEqual:trackDurationConnection]) {
		[trackDurationData appendData:data];
	}
	if ([connection isEqual:trackEndOfFadeInConnection]) {
		[trackEndOfFadeInData appendData:data];
	}
	if ([connection isEqual:trackKeyConnection]) {
		[trackKeyData appendData:data];
	}
	if ([connection isEqual:trackLoudnessConnection]) {
		[trackLoudnessData appendData:data];
	}
	if ([connection isEqual:trackMetadataConnection]) {
		[trackMetadataData appendData:data];
	}
	if ([connection isEqual:trackModeConnection]) {
		[trackModeData appendData:data];
	}
	if ([connection isEqual:trackSectionsConnection]) {
		[trackSectionsData appendData:data];
	}
	if ([connection isEqual:trackSegmentsConnection]) {
		[trackSegmentsData appendData:data];
	}
	if ([connection isEqual:trackStartOfFadeOutConnection]) {
		[trackStartOfFadeOutData appendData:data];
	}
	if ([connection isEqual:trackTatumsConnection]) {
		[trackTatumsData appendData:data];
	}
	if ([connection isEqual:trackTempoConnection]) {
		[trackTempoData appendData:data];
	}
	if ([connection isEqual:trackTimeSignatureConnection]) {
		[trackTimeSignatureData appendData:data];
	}
}
-(void) connectionDidFinishLoading:(NSURLConnection *)connection {	
	if ([connection isEqual:trackBarsConnection]) {
		notificationName = @"ENTrackBarsLoaded";
		[xmlParser initWithData:trackBarsData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackBeatsConnection]) {
		notificationName = @"ENTrackBeatsLoaded";
		[xmlParser initWithData:trackBeatsData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackDurationConnection]) {
		notificationName = @"ENTrackDurationLoaded";
		[xmlParser initWithData:trackDurationData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackEndOfFadeInConnection]) {
		notificationName = @"ENTrackEndOfFadeInLoaded";
		[xmlParser initWithData:trackEndOfFadeInData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackStartOfFadeOutConnection]) {
		notificationName = @"ENTrackStartOfFadeOutLoaded";
		[xmlParser initWithData:trackStartOfFadeOutData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackKeyConnection]) {
		notificationName = @"ENTrackKeyLoaded";
		[xmlParser initWithData:trackKeyData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackLoudnessConnection]) {
		notificationName = @"ENTrackLoudnessLoaded";
		[xmlParser initWithData:trackLoudnessData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackMetadataConnection]) {
		notificationName = @"ENTrackMetadataLoaded";
		[xmlParser initWithData:trackMetadataData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackModeConnection]) {
		notificationName = @"ENTrackModeLoaded";
		[xmlParser initWithData:trackModeData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackSectionsConnection]) {
		notificationName = @"ENTrackSectionsLoaded";
		[xmlParser initWithData:trackSectionsData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackSegmentsConnection]) {
		notificationName = @"ENTrackSegmentsLoaded";
		[xmlParser initWithData:trackSegmentsData];
		[xmlParser parse];
	}	
	if ([connection isEqual:trackTatumsConnection]) {
		notificationName = @"ENTrackTatumsLoaded";
		[xmlParser initWithData:trackTatumsData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackTempoConnection]) {
		notificationName = @"ENTrackTempoLoaded";
		[xmlParser initWithData:trackTempoData];
		[xmlParser parse];
	}
	if ([connection isEqual:trackTimeSignatureConnection]) {
		notificationName = @"ENTrackTimeSignatureLoaded";
		[xmlParser initWithData:trackTimeSignatureData];
		[xmlParser parse];
	}
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	if ([notificationName isEqual:@"ENTrackBarsLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackBars = [[NSMutableArray alloc] init];
		}
		if ([elementName isEqual:@"bar"]) {
			currentBar = [[ENBar alloc] init];
			currentBar.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}		
	};	
	if ([notificationName isEqual:@"ENTrackTatumsLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackTatums = [[NSMutableArray alloc] init];
		}
		if ([elementName isEqual:@"tatum"]) {
			currentTatum = [[ENTatum alloc] init];
			currentTatum.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}		
	};	
	if ([notificationName isEqual:@"ENTrackBeatsLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackBeats = [[NSMutableArray alloc] init];
		}
		if ([elementName isEqual:@"beat"]) {
			currentBeat = [[ENBeat alloc] init];
			currentBeat.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}		
	};
	if ([notificationName isEqual:@"ENTrackSectionsLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackSections = [[NSMutableArray alloc] init];
		}
		if ([elementName isEqual:@"section"]) {
			currentSection = [[ENSection alloc] init];
			currentSection.startTime = [[attributeDict valueForKey:@"start"] floatValue];
			currentSection.time = [[attributeDict valueForKey:@"duration"] floatValue];
			[trackSections addObject:currentSection];
		}
	};	
	if ([notificationName isEqual:@"ENTrackKeyLoaded"]) {
		if ([elementName isEqual:@"key"]) {
			trackKey = [[ENKey alloc] init];
			trackKey.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackTempoLoaded"]) {
		if ([elementName isEqual:@"tempo"]) {
			trackTempo = [[ENTempo alloc] init];
			trackTempo.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackTimeSignatureLoaded"]) {
		if ([elementName isEqual:@"time_signature"]) {
			trackTimeSignature = [[ENTimeSignature alloc] init];
			trackTimeSignature.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackModeLoaded"]) {
		if ([elementName isEqual:@"mode"]) {
			trackMode = [[ENMode alloc] init];
			trackMode.confidence = [[attributeDict valueForKey:@"confidence"] floatValue];
		}
	};
	
	if ([notificationName isEqual:@"ENTrackMetadataLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackMetadata = [[ENMetadata alloc] init];
		}
	};
	
	if ([notificationName isEqual:@"ENTrackSegmentsLoaded"]) {
		if ([elementName isEqual:@"analysis"]) {
			trackSegments = [[NSMutableArray alloc] init];			
		}
		if ([elementName isEqual:@"segment"]) {
			currentSegment = [[ENSegment alloc] init];
			currentSegment.startTime = [[attributeDict valueForKey:@"start"] floatValue];
			currentSegment.time = [[attributeDict valueForKey:@"duration"] floatValue];
		}
		if ([elementName isEqual:@"dB"]) {			
			if ([[attributeDict valueForKey:@"type"] isEqual:@"max"]) {
				currentLoudnessType = @"max";
				currentSegmentMaxLoudness = [[ENSegmentLoudness alloc] init];
				currentSegmentMaxLoudness.startTime = [[attributeDict valueForKey:@"time"] floatValue];
				currentSegmentMaxLoudness.type = @"max";
			} else {
				currentLoudnessType = @"global";
				currentSegmentLoudness = [[ENSegmentLoudness alloc] init];
				currentSegmentLoudness.startTime = [[attributeDict valueForKey:@"time"] floatValue];
				currentSegmentLoudness.type = @"global";
			};
		}
		if ([elementName isEqual:@"pitches"]) {
			pitches = [[NSMutableArray alloc] init];
		}
		if ([elementName isEqual:@"timbre"]) {
			timbre = [[NSMutableArray alloc] init];
		}
	};
	
	currentStringValue =[[NSMutableString alloc] init];	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {	
	[currentStringValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if ([elementName isEqual:@"message"]) {
		if ([currentStringValue isEqual:@"Success"]) {
			success = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]	forKey:[NSString stringWithString:@"success"]];
		} else {
			success = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]	forKey:[NSString stringWithString:@"success"]];
		}
	}
	if ([notificationName isEqual:@"ENTrackBarsLoaded"]) {
		if ([elementName isEqual:@"bar"]) {
			currentBar.time = [currentStringValue floatValue];
			[trackBars addObject:currentBar];
		}
	};
	if ([notificationName isEqual:@"ENTrackTatumsLoaded"]) {
		if ([elementName isEqual:@"tatum"]) {
			currentTatum.time = [currentStringValue floatValue];
			[trackTatums addObject:currentTatum];
		}
	};
	if ([notificationName isEqual:@"ENTrackBeatsLoaded"]) {
		if ([elementName isEqual:@"beat"]) {
			currentBeat.time = [currentStringValue floatValue];
			[trackBeats addObject:currentBeat];
		}
	};	
	if ([notificationName isEqual:@"ENTrackDurationLoaded"]) {
		if ([elementName isEqual:@"duration"]) {
			trackDuration = [[ENDuration alloc] init];
			trackDuration.time = [currentStringValue floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackEndOfFadeInLoaded"]) {
		if ([elementName isEqual:@"end_of_fade_in"]) {
			trackEndOfFadeIn = [[ENEndOfFadeIn alloc] init];
			trackEndOfFadeIn.time = [currentStringValue floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackStartOfFadeOutLoaded"]) {
		if ([elementName isEqual:@"start_of_fade_out"]) {
			trackStartOfFadeOut = [[ENStartOfFadeOut alloc] init];
			trackStartOfFadeOut.time = [currentStringValue floatValue];
		}
	};
	
	if ([notificationName isEqual:@"ENTrackKeyLoaded"]) {
		if ([elementName isEqual:@"key"]) {
			trackKey.key = [currentStringValue intValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackTempoLoaded"]) {
		if ([elementName isEqual:@"tempo"]) {
			trackTempo.tempo = [currentStringValue floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackTimeSignatureLoaded"]) {
		if ([elementName isEqual:@"time_signature"]) {
			trackTimeSignature.signature = [currentStringValue floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackMode"]) {
		if ([elementName isEqual:@"mode"]) {
			trackMode.mode = [currentStringValue intValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackLoudnessLoaded"]) {
		if ([elementName isEqual:@"loudness"]) {
			trackLoudness = [[ENLoudness alloc] init];
			trackLoudness.loudness = [currentStringValue floatValue];
		}
	};
	if ([notificationName isEqual:@"ENTrackMetadataLoaded"]) {
		if ([elementName isEqual:@"status"]) {
			trackMetadata.status = currentStringValue;
		}
		if ([elementName isEqual:@"artist"]) {
			trackMetadata.artist = currentStringValue;
		}
		if ([elementName isEqual:@"release"]) {
			trackMetadata.album = currentStringValue;
		}
		if ([elementName isEqual:@"title"]) {
			trackMetadata.title = currentStringValue;
		}
		if ([elementName isEqual:@"duration"]) {
			trackMetadata.duration = [currentStringValue floatValue];
		}
		if ([elementName isEqual:@"samplerate"]) {
			trackMetadata.samplerate = [currentStringValue floatValue];
		}
		if ([elementName isEqual:@"bitrate"]) {
			trackMetadata.bitrate = [currentStringValue floatValue];
		}
	};
	
	if ([notificationName isEqual:@"ENTrackSegmentsLoaded"]) {
		if ([elementName isEqual:@"segment"]) {
			[trackSegments addObject:currentSegment];
		}
		if ([elementName isEqual:@"dB"]) {			
			if ([currentLoudnessType isEqual:@"global"]) {
				currentSegmentLoudness.loudness = [currentStringValue floatValue];
				[currentSegment setGlobalLoudness:currentSegmentLoudness];
			} else {
				currentSegmentMaxLoudness.loudness = [currentStringValue floatValue];
				[currentSegment setMaxLoudness:currentSegmentMaxLoudness];
			};
		}
		if ([elementName isEqual:@"pitch"]) {
			[pitches addObject:[NSNumber numberWithFloat:[currentStringValue floatValue]]];
		}
		if ([elementName isEqual:@"pitches"]) {
			[currentSegment setPitches:pitches];
		}
		if ([elementName isEqual:@"coeff"]) {
			[timbre addObject:[NSNumber numberWithFloat:[currentStringValue floatValue]]];
		}
		if ([elementName isEqual:@"timbre"]) {
			[currentSegment setTimbre:timbre];
		}
	}
	[currentStringValue release];
	currentStringValue = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSNotification* not;
	if ([notificationName isEqual:@"ENTrackBarsLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackBars userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackTatumsLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackTatums userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackBeatsLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackBeats userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackSectionsLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackSections userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackDurationLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackDuration userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackEndOfFadeInLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackEndOfFadeIn userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackStartOfFadeOutLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackStartOfFadeOut userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackKeyLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackKey userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackLoudnessLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackLoudness userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackModeLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackMode userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackMetadataLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackMetadata userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackTempoLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackTempo userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackTimeSignatureLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackTimeSignature userInfo:success];
	}
	if ([notificationName isEqual:@"ENTrackSegmentsLoaded"]) {
		not = [NSNotification notificationWithName:notificationName object:trackSegments userInfo:success];
	}
	[[NSNotificationCenter defaultCenter] postNotification:not];
}


@end

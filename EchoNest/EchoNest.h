//
//  EchoNest.h
//  EchoNest
//
//  Created by Kamel Makhloufi on 17/06/09.
//  Copyright 2009 melka. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ENArtist.h"
#import "ENTrack.h"
#include <CommonCrypto/CommonDigest.h>
/**
 Base Class for dealing with the Echonest API
 */
@interface EchoNest : NSObject {
	// ARTIST
	ENArtist* artist;
	
	// TRACK
	ENTrack* track;
	
@private
	
	NSMutableURLRequest* req;
	
	// GENERAL
	NSURLConnection* apiKeyValidationConnection;
	NSMutableData* apiKeyValidationData;
	
	// CHARTS
	NSURLConnection* topHottArtistsConnection;
	NSMutableData* topHottArtistsData;
	NSURLConnection* topHottTracksConnection;
	NSMutableData* topHottTracksData;

	// SEARCH
	NSURLConnection* artistSearchConnection;
	NSMutableData* artistSearchData;
	NSURLConnection* trackSearchConnection;
	NSMutableData* trackSearchData;
	
	// TRACK UPLOAD
	NSURLConnection*	trackUploadConnection;
	NSMutableData*		trackUploadData;
	NSMutableData*		trackUploadResponseData;
	NSURLConnection*	trackUploadValidationConnection;
	NSMutableData*		trackUploadValidationData;
	
	// TEMP DATAS
	NSXMLParser*		xmlParser;
	NSMutableString*	currentStringValue;
	NSString*			notificationName;

	// VERIFICATION
	BOOL apiKeyIsValid;
	
	// EchoNest URL Parameters
	NSString* baseUrl;	// http://developer.echonest.com/api/;
	NSString* apiKey;		// Your API Key
	NSString* artistId;	// An Artist ID if known. Example Artist ID : music://id.echonest.com/~/AR/ARVXU2X1187B9AE6D8
	NSString* trackMD5;	// A Track ID if known. Example Track ID : music://id.echonest.com/~/TR/TRLFPPE11C3F10749F
	NSString* filePath;	// A Track ID if known. Example Track ID : music://id.echonest.com/~/TR/TRLFPPE11C3F10749F
}

@property (nonatomic, retain) NSString*	apiKey;
@property (nonatomic, retain) NSString*	artistId;
@property (nonatomic, retain) NSString*	trackMD5;
@property (nonatomic, retain) NSString*	baseUrl;
@property (nonatomic, retain) NSString*	filePath;

-(id) initWithAPIKey:(NSString*)APIKey andArtistID:(NSString*)artistID andTrackMD5:(NSString*)trackMD5;
-(id) initWithAPIKey:(NSString*)APIKey andArtistID:(NSString*)artistID;
-(id) initWithAPIKey:(NSString*)APIKey;
-(id) init;
-(void) validateApiKey;
-(void) searchArtistWithString:(NSString*)input;
-(void) searchTracksWithString:(NSString*)input;
-(void) initializeArtist;
-(void) initializeTrack;
-(void) uploadFile:(NSString*)path;
-(void) uploadData;

-(ENArtist*)artist;
-(ENTrack*)track;

-(NSString *) urlencode: (NSString *) url;
-(NSString*) md5:(NSData*)data;

@end

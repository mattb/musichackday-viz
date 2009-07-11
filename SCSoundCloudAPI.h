/*
 * Copyright 2009 Ullrich Schäfer, Gernot Poetsch for SoundCloud Ltd.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * For more information and documentation refer to
 * http://soundcloud.com/api
 * 
 */

#import <Foundation/Foundation.h>


@class SCSoundCloudAPIConfiguration;
@class OAConsumer;
@class OADataFetcher;
@class OAToken;
@protocol SCSoundCloudAPIDelegate;
@protocol SCSoundCloudAPIAuthenticationDelegate;

typedef enum {
	SCAuthenticationStatusNotAuthenticated,			// api is not authenticated. -> requestAuthentication
	SCAuthenticationStatusAuthenticated,			// api is authenticated and ready to use
	SCAuthenticationStatusGettingToken,				// wait till 
	SCAuthenticationStatusWillAuthorizeRequestToken	// got request token. need to authenticate it. -> authorizeRequestToken
} SCAuthenticationStatus;

typedef enum {
	SCResponseFormatXML,
	SCResponseFormatJSON
} SCResponseFormat;


@interface SCSoundCloudAPI : NSObject {
	OAConsumer *_oauthConsumer;
	
	id<SCSoundCloudAPIDelegate> delegate;
	id<SCSoundCloudAPIAuthenticationDelegate> authDelegate;
	NSMutableArray *_dataFetchers;
	OADataFetcher *_authDataFetcher;
	
	OAToken *_requestToken;
	OAToken *_accessToken;
	SCAuthenticationStatus status;
	SCResponseFormat responseFormat;
}

@property (nonatomic, assign) id<SCSoundCloudAPIDelegate> delegate;
@property (nonatomic, assign) id<SCSoundCloudAPIAuthenticationDelegate> authDelegate;
@property (readonly) SCAuthenticationStatus status;
@property SCResponseFormat responseFormat;

- (id)initWithAuthenticationDelegate:(id<SCSoundCloudAPIAuthenticationDelegate>)authDelegate;

// API Authentication

/*!
 * sends request for unauthenticated request token and tries to authenticate it
 * if no error occures, results in the authentication delegate beeing requested to open token authentication url
 */
- (void)requestAuthentication;

/*!
 * sends request token to server for authentication.
 * if no error, sets the access token.
 */
- (void)authorizeRequestToken;

/*!
 * resets all tokens to nil, and removes them from the keychain
 */
- (void)resetAuthentication;


// API method
- (void)performMethod:(NSString *)httpMethod
		   onResource:(NSString *)resource
	   withParameters:(NSDictionary *)parameters
			  context:(id)targetContext;

@end


@protocol SCSoundCloudAPIAuthenticationDelegate <NSObject>
- (SCSoundCloudAPIConfiguration *)configurationForSoundCloudAPI:(SCSoundCloudAPI *)scAPI;
- (void)soundCloudAPI:(SCSoundCloudAPI *)scAPI requestedAuthenticationWithURL:(NSURL *)authURL;
- (void)soundCloudAPI:(SCSoundCloudAPI *)scAPI didChangeAuthenticationStatus:(SCAuthenticationStatus)status;
- (void)soundCloudAPI:(SCSoundCloudAPI *)scAPI didEncounterError:(NSError *)error;
@end


@protocol SCSoundCloudAPIDelegate <NSObject>
- (void)soundCloudAPI:(SCSoundCloudAPI *)api didFinishWithData:(NSData *)data context:(id)context;
- (void)soundCloudAPI:(SCSoundCloudAPI *)api didFailWithError:(NSError *)error context:(id)context;
- (void)soundCloudAPI:(SCSoundCloudAPI *)api didReceiveData:(NSData *)data context:(id)context;
- (void)soundCloudAPI:(SCSoundCloudAPI *)api didReceiveBytes:(unsigned long long)loadedBytes total:(unsigned long long)totalBytes context:(id)context;
- (void)soundCloudAPI:(SCSoundCloudAPI *)api didSendBytes:(unsigned long long)sendBytes total:(unsigned long long)totalBytes context:(id)context;
@end